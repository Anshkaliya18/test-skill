import { copyFileSync, mkdirSync } from 'fs';
import { dirname, join } from 'path';
import { homedir } from 'os';
import { fileURLToPath } from 'url';

const skills = ['resume-make', 'resume-update', 'resume-suggest'];

const targets = [
  join(homedir(), '.claude', 'skills'),
  join(homedir(), '.agents', 'skills'),
  join(homedir(), '.codex', 'skills'),
  join(homedir(), '.config', 'opencode', 'skills'),
  join(homedir(), '.config', 'kilo', 'skills'),
  join(homedir(), '.qwen', 'skills'),
];

// Also check Windows APPDATA for OpenCode
if (process.env.APPDATA) {
  targets.push(join(process.env.APPDATA, 'opencode', 'skills'));
}

const scriptDir = dirname(fileURLToPath(import.meta.url));
const srcRoot = join(scriptDir, '..', 'skills');

for (const target of targets) {
  for (const skill of skills) {
    const src = join(srcRoot, skill, 'SKILL.md');
    const dest = join(target, skill, 'SKILL.md');
    mkdirSync(dirname(dest), { recursive: true });
    copyFileSync(src, dest);
    console.log(`Installed ${skill} -> ${target}`);
  }
}

console.log('Resume skills installed globally for all supported agents.');
