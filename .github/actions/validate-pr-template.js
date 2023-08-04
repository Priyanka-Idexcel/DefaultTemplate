// .github/actions/validate-pr-template.js
const core = require('@actions/core');

try {
  const prTemplate = context.payload.pull_request.body;
  const requiredFields = ['Title', 'Description', 'Related', 'Issues', 'Checklist'];

  const missingFields = requiredFields.filter(field => !prTemplate.includes(field));
  if (missingFields.length > 0) {
    core.setFailed(`Missing fields in PR template: ${missingFields.join(', ')}`);
  }
} catch (error) {
  core.setFailed(error.message);
}
