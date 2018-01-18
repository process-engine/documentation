const markdownLinkRegex = /\[([^\[]+)\]\(([^\)]+)\)/;
const lastParentFolderRegex = /(.*\/)?(.*\.md)/;
const httpLinkRegex = /https?:\/\/.*/;
const removeFragmentRegex = /#.*/;

const rawLinks = process.argv[2].split('\n');

const parsedLinks = rawLinks.map(parseRawLink);

const httpLinks = parsedLinks.filter((link) => link.isHttpLink);
const localLinks = parsedLinks.filter((link) => !link.isHttpLink);

for (const link of parsedLinks) {
  if (link.isHttpLink) {
    console.log(link.linkTarget);
  } else {
    const relativePathResolved = resolveRelativePath(link);
    const fragmentRemoved = removeFragment(relativePathResolved);
    console.log(`${fragmentRemoved}`)
  }
}

function removeFragment(linkTarget) {
  return linkTarget.replace(removeFragmentRegex, '');
}

function resolveRelativePath(link) {
  let parentFolder = './';
  if (link.file.length > 0) {
    parentFolder = lastParentFolderRegex.exec(link.file)[1];
    if (parentFolder === undefined) {
      parentFolder = '';
    }
  }

  return `${parentFolder}${link.linkTarget}`;
}

function isHttpLink(linkTarget) {
  return httpLinkRegex.test(linkTarget);
}

function parseRawLink(rawLink) {
  const firstColon = rawLink.indexOf(':');

  const file = rawLink.substring(0, firstColon);
  const linkText = rawLink.substring(firstColon + 1);

  const linkTarget = markdownLinkRegex.exec(linkText)[2];

  return {
    file: file,
    linkTarget: linkTarget,
    isHttpLink: isHttpLink(linkTarget)
  };
};
