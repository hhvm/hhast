/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

window.addEventListener('load', function() {

var selected = null;
var infoSelectedLeft = null;
var infoSelectedRight= null;
let info = document.querySelector('div.info');

function selectElement(event) {
  if (selected) {
    selected.classList.remove('selected');
  }
  if (infoSelectedLeft) {
    infoSelectedLeft.classList.remove('infoSelected');
    infoSelectedRight.classList.remove('infoSelected');
    infoSelectedLeft = null;
    infoSelectedRight = null;
  }

  selected = event.target;
  selected.classList.add('selected');
  event.stopPropagation();

  const selectedNodeText = document.createTextNode(selected.dataset.node);
  const selectedStrong = document.createElement('strong');
  selectedStrong.classList.add('selected');
  selectedStrong.appendChild(selectedNodeText);
  const selectedLI = document.createElement('li');
  selectedLI.appendChild(selectedStrong);
  const stack = document.createElement('ul');
  stack.appendChild(selectedLI);

  var current = selected.parentElement;
  while(current) {
    if (!current.dataset.field) {
      break;
    }
    let field = current.dataset.field;
    current = current.parentElement;
    if (!current.dataset.node) {
      break;
    }
    let node = current.dataset.node;
    let target = current;
    current = current.parentElement;

    const item = document.createElement('li');
    const nodeAnchor = document.createElement('a');
    nodeAnchor.appendChild(document.createTextNode(node));
    nodeAnchor.href = '#';
    item.appendChild(nodeAnchor);
    item.appendChild(document.createElement('br'));
    item.appendChild(document.createTextNode(' -> '+field));
    stack.appendChild(item);

    nodeAnchor.addEventListener('click', (event) => {
      if (infoSelectedLeft) {
        infoSelectedLeft.classList.remove('infoSelected');
        infoSelectedRight.classList.remove('infoSelected');
      }
      infoSelectedLeft = item;
      infoSelectedRight = target;
      infoSelectedLeft.classList.add('infoSelected');
      infoSelectedRight.classList.add('infoSelected');

      event.preventDefault();
      event.stopPropagation();
    });
  }

  while (info.firstChild) {
    info.removeChild(info.firstChild);
  }
  info.appendChild(stack);
}

document.querySelector('code.language-hack').addEventListener('click', selectElement);

});
