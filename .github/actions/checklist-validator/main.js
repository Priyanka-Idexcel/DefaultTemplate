const fs = require('fs');
const path = require('path');

let directeryName = __dirname;
console.log(directeryName.split('.github')[0], directeryName)

process.env["GITHUB_WORKSPACE"]=`${directeryName.split('.github')[0]}/`;
const prTemplatePath = path.join(process.env.GITHUB_WORKSPACE, '.github', 'PULL_REQUEST_TEMPLATE.md');
const prTemplateContent = fs.readFileSync(prTemplatePath, 'utf-8');

console.log(',,,,,,,,,,,,,', prTemplateContent.indexOf('[ ]'))
const checkboxPattern = /^\s*-\s*\[x\]/gm;
let checkboxMatches = prTemplateContent.match(checkboxPattern);
console.log(',,,,,,,,,,,,,', checkboxMatches)
// 
// checkboxMatches && checkboxMatches.length === 0


if(prTemplateContent.indexOf('[ ]') && prTemplateContent.indexOf('[ ]') != -1) {
  console.error('error: PR checklist is incomplete. Please mark all checkboxes.');
  process.exit(1);
} 
// else if (checkboxMatches && checkboxMatches.length < requiredCheckboxCount) {
//   console.error('error: PR checklist is incomplete. Please mark all checkboxes.');
//   process.exit(1);
// } 
else {
  console.log('PR checklist is complete.');
}

// const fs = require('fs');
// const path = require('path');

// process.env["GITHUB_WORKSPACE"]="/home/ubuntu/Projects/testing/DefaultTemplate/";

// const prTemplatePath = path.join(process.env.GITHUB_WORKSPACE, '.github', 'PULL_REQUEST_TEMPLATE.md');
// const prTemplateContent = fs.readFileSync(prTemplatePath, 'utf-8');

// const checkboxPattern = /^\s*-\s*\[x\]/gm;
// const checkboxMatches = prTemplateContent.match(checkboxPattern);

// if (!checkboxMatches)
//   console.error('error: No checkboxes found in the PR Template')
//  process.exit(1)

// const requiredCheckboxCount =  0
// if (checkboxMatches.length < requiredCheckboxCount) {
//   console.error('error: PR checklist is incomplete. Please mark all checkboxes.');
//   process.exit(1);
// }

// console.log('PR checklist is complete.');

