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
    infoSelectedRight.forEach(node => node.classList.remove('infoSelected'));
    infoSelectedLeft = null;
    infoSelectedRight = null;
  }

  selected = event.target;
  selected.classList.add('selected');
  event.stopPropagation();

  const selectedNodeText = document.createTextNode(selected.dataset.kind);
  const selectedStrong = document.createElement('strong');
  selectedStrong.classList.add('selected');
  selectedStrong.appendChild(selectedNodeText);
  const selectedLI = document.createElement('li');
  selectedLI.appendChild(selectedStrong);
  const stack = document.createElement('ul');
  stack.appendChild(selectedLI);

  let trace = selected.dataset.trace.split(' ').map(entry => {
    let parts = entry.split('.');
    return { kind: parts[0], id: parts[1], field: parts[2] };
  }).reverse();

  trace.forEach(frame => {
    let { kind, id, field } = frame;

    const item = document.createElement('li');
    const nodeAnchor = document.createElement('a');
    nodeAnchor.appendChild(document.createTextNode(kind));
    nodeAnchor.href = '#';
    item.appendChild(nodeAnchor);
    item.appendChild(document.createElement('br'));
    item.appendChild(document.createTextNode(' -> '+field));
    stack.appendChild(item);

    nodeAnchor.addEventListener('click', (event) => {
      if (infoSelectedLeft) {
        infoSelectedLeft.classList.remove('infoSelected');
        infoSelectedRight.forEach(node => node.classList.remove('infoSelected'));
      }
      infoSelectedLeft = item;
      infoSelectedRight = document.querySelectorAll('.hs-id-'+id);
      infoSelectedLeft.classList.add('infoSelected');
      infoSelectedRight.forEach(node => node.classList.add('infoSelected'));

      event.preventDefault();
      event.stopPropagation();
    });
  });

  while (info.firstChild) {
    info.removeChild(info.firstChild);
  }
  info.appendChild(stack);
}

document.querySelector('code.language-hack').addEventListener('click', selectElement);

});
