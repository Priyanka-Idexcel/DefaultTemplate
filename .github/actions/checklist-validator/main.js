// const fs = require('fs');
// const path = require('path');

// const prTemplatePath = path.join(process.env.GITHUB_WORKSPACE, '.github', 'PULL_REQUEST_TEMPLATE.md');
// const prTemplateContent = fs.readFileSync(prTemplatePath, 'utf-8');

// const checkboxPattern = /^\s*-\s*\[x\]/gm;
// const checkboxMatches = prTemplateContent.match(checkboxPattern);

// if checkboxMatches.length === 0 {
//   console.error('error: PR checklist is missing. Please add checkboxes to your template.');
//   process.exit(1);
// } else if (checkboxMatches.length < requiredCheckboxCount) {
//   console.error('error: PR checklist is incomplete. Please mark all checkboxes.');
//   process.exit(1);
// } else {
//   console.log('PR checklist is complete.');
// }

const fs = require('fs');
const path = require('path');

process.env["GITHUB_WORKSPACE"]="/home/ubuntu/Projects/testing/DefaultTemplate/";

const prTemplatePath = path.join(process.env.GITHUB_WORKSPACE, '.github', 'PULL_REQUEST_TEMPLATE.md');
const prTemplateContent = fs.readFileSync(prTemplatePath, 'utf-8');

const checkboxPattern = /^\s*-\s*\[x\]/gm;
const checkboxMatches = prTemplateContent.match(checkboxPattern);

if (!checkboxMatches)
  console.error('error: No checkboxes found in the PR Template')
 process.exit(1)

const requiredCheckboxCount =  0
if (checkboxMatches.length < requiredCheckboxCount) {
  console.error('error: PR checklist is incomplete. Please mark all checkboxes.');
  process.exit(1);
}

console.log('PR checklist is complete.');

