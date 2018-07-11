/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */
'use babel';

const { AutoLanguageClient } = require('atom-languageclient');
const fs = require('fs');
const cp = require('child_process');

class HHASTLanguageClient extends AutoLanguageClient {
  getGrammarScopes() { return ['source.hack', 'text.html.hack']; }
  getLanguageName() { return 'Hack'; }
  getServerName() { return 'HHAST' }

  async startServerProcess(workspace) {
    fs.accessSync(workspace + '/hhast-lint.json');

    // Most common path
    let hhast = workspace + '/vendor/bin/hhast-lint';
    try {
      fs.accessSync(hhast);
    } catch (_) {
      // path if working on hhast itself
      hhast = workspace + '/bin/hhast-lint';
      fs.accessSync(hhast);
    }

    let remembered = atom.config.get('atom-ide-hhast.rememberedWorkspaces') || {};
    if (remembered[workspace] === 'untrusted') {
      throw 'Untrusted';
    }
    if (remembered[workspace] !== 'trusted') {
      const result = await new Promise((resolve, _) => atom.confirm({
        message: 'Run hhast-lint?',
        detail: 'This project uses `' + hhast + '` for linting; do you want ' +
          'to execute it? This has the same security risks as executing any ' +
          'other code in the repository.',
        buttons: ['Yes', 'Always', 'No', 'Never'],
        defaultId: 3,
      }, response => resolve(response))
      );
      switch (result) {
        // @ts-ignore: Fallthrough case in switch
        case 1: // Always
          remembered[workspace] = 'trusted';
          atom.config.set('atom-ide-hhast.rememberedWorkspaces', remembered);
        case 0: // Yes
          break;
        // @ts-ignore: Fallthrough case in switch
        case 3: // Never
          remembered[workspace] = 'untrusted';
          atom.config.set('atom-ide-hhast.rememberedWorkspaces', remembered);
        case 2: // No
          throw 'Untrusted';
      }
    }

    return cp.spawn(
      hhast,
      [
        '--mode',
        'lsp',
        '--from',
        'atom-ide-hhast',
        ...atom.config.get('atom-ide-hhast.arguments')
      ],
      {
        cwd: workspace
      }
    );
  }
}

module.exports = new HHASTLanguageClient();
module.exports.config = {
  arguments: {
    type: 'array',
    items: {
      type: 'string',
    },
    'default': [],
    'description': 'Additional arguments to pass to hhast-lint'
  },
  lintMode: {
    type: 'string',
    enum: ['whole-project', 'open-files'],
    default: 'whole-project',
    description: 'Whether to lint the whole project, or just open files'
  },
  rememberedWorkspaces: {
    type: 'object',
    additionalProperties: {
      type: 'string',
      enum: ['trusted', 'untrusted'],
    },
    default: {},
    description: 'Workspaces where whether or not to use HHAST has been remembered'
  }
};
