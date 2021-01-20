// --------------------
// Configuration
// --------------------
settings.scrollStepSize = 120;
settings.language = "en-US";

// Theme
settings.theme = `
#sk_status, #sk_find {
  font-size: 12pt;
}
#sk_omnibarSearchResult ul li {
  font-size: 14pt;
}
#sk_omnibarSearchResult ul li div.title {
  font-size: 12pt;
}
#sk_omnibarSearchResult ul li div.url {
  font-size: 10pt;
}
`;
Hints.style("font-size: 12pt;", "text");
Hints.style("font-size: 10pt;");

// --------------------
// Remapping (vimium)
// --------------------
// Toggle
map("<Ctrl-x>", "<Alt-s>");
map("<Ctrl-o>", "<Alt-i>");
unmap("<Alt-s>");
unmap("<Alt-i>");

// Navigation
map("u", "e");
unmap("e");

// History
map("A", "S"); // A: go back in history
unmap("S");
map("S", "D"); // S: go forward in history
unmap("D");

// Tab
map(">_t", "t");
unmap("t");
map("tt", ">_t");
unmap(">_t");
map("tr", "<Ctrl-6>");
unmap("<Ctrl-6>");
map("gt", "R");
map("gT", "E");

// Omnibar
cmap("<Ctrl-x>", "<Ctrl-j>"); // <C-k>: previous candidate
cmap("<Ctrl-j>", "<Tab>"); // <C-j>: next candidate
cmap("<Ctrl-k>", "<Shift-Tab>"); // <C-k>: previous candidate
cmap("<Ctrl-h>", "<Ctrl-,>");
cmap("<Ctrl-l>", "<Ctrl-.>");

// Basic
map("F", "gf");
vmap("H", "0");
vmap("L", "$");

// Paste
mapkey("p", "Open the clipboard's URL in the current tab", function () {
  Front.getContentFromClipboard(function (response) {
    window.location.href = response.data;
  });
});
map("P", "cc");
map("`", "'");

// Bookmarks
map(";bb", "b");
unmap("b");
map("bb", ";bb");
unmap(";bb");
map("ba", "ab");
unmap("ab");
map("bd", ";db");
unmap(";db");

// --------------------
// Transalte
// --------------------
settings.autoSpeakOnInlineQuery = false;

Front.registerInlineQuery({
  url: function (q) {
    return `http://dict.youdao.com/w/eng/${q}/#keyfrom=dict2.index`;
  },
  parseResult: function (res) {
    var parser = new DOMParser();
    var doc = parser.parseFromString(res.text, "text/html");
    var transResult = doc.querySelector(".trans-container");
    var keyword = doc.querySelector(".keyword");
    if (transResult) {
      return `
          <div style="padding-left: 8pt; padding-right: 16pt"> 
            <h2> ${keyword.innerHTML} </h2>
            ${transResult.innerHTML}
          <div>`;
    } else {
      return `
          <div style="padding-left: 8pt; padding-right: 16pt"> 
            <h2>No result...</h2>
          <div>`;
    }
  },
});

translateWord = () => () => {
  var w = Visual.getWordUnderCursor();
  var cursor = document.querySelector(".surfingkeys_cursor");
  var b = cursor.getBoundingClientRect();
  Front.performInlineQuery(
    w,
    {
      top: b.top,
      left: b.left,
      height: b.height,
      width: b.width,
    },
    function (pos, queryResult) {
      Front.showBubble(pos, queryResult, true);
    }
  );
};

// Mapping
vmapkey("q", "Transalte under word", translateWord());

// --------------------
// Search engine
// --------------------
// Remap function
remaps = (ori, target) => {
  remap(ori, target);
  vremap(ori, target);
};
remap = (ori, target) => {
  var tmp = `>_${ori}`;
  map(tmp, ori);
  unmap(ori);
  map(target, tmp);
  unmap(tmp);
};
vremap = (ori, target) => {
  var tmp = `>_${ori}`;
  vmap(tmp, ori);
  vunmap(ori);
  vmap(target, tmp);
  vunmap(tmp);
};

// Remap
unmap("ob");
unmap("og");
unmap("od");
unmap("oy");
unmap("ow");
unmap("sb");
remaps("sg", "sgg");
remaps("sd", "sdd");
remaps("sw", "sbi");
remaps("se", "swp");
remaps("ss", "sso");
remaps("sy", "syt");
unmap("sh");

const searchEngines = {};

// Github
searchEngines.gh = {
  alias:  "gh",
  engine: "github",
  url:    "https://github.com/search?q=",
  compl:  "https://api.github.com/search/repositories?sort=stars&order=desc&q=",
};
searchEngines.gh.callback = (response) => {
  var res = JSON.parse(response.text)["items"];
  return res
    ? res.map((r) => {
        return {
          title: ` [★ ${r.stargazers_count}] - ${r.full_name} - ${r.description}`,
          url: r.html_url,
        };
      })
    : [];
};

// StackOverflow
searchEngines.so = {
  alias:  "so",
  engine: "stackoverflow",
  url:    "https://stackoverflow.com/search?q=",
  compl:  "https://api.stackexchange.com/2.2/search/advanced?pagesize=10&order=desc&sort=relevance&site=stackoverflow&q=",
};
searchEngines.so.callback = (response) => {
  var res = JSON.parse(response.text)["items"];
  return res
    ? res.map((r) => {
        return {
          title: ` [★ ${r.score}] - ${r.title}`,
          url: r.link,
        };
      })
    : [];
};

// DockerHub
searchEngines.dh = {
  alias:  "dh",
  engine: "dockerhub",
  url:    "https://hub.docker.com/search/?page=1&q=",
  compl:  "https://hub.docker.com/v2/search/repositories/?page_size=20&query=",
};
searchEngines.dh.callback = (response) => {
  var res = JSON.parse(response.text)["results"];
  return res
    ? res.map((r) => {
        return {
          title: ` [★ ${r.star_count}] - ${r.repo_name} - ${r.short_description}`,
          url: `https://hub.docker.com/r/${r.repo_name}`,
        };
      })
    : [];
};

// Pub Dev
searchEngines.pd = {
  alias:  "pd",
  engine: "pub.dev",
  url:    "https://pub.dev/packages?q=",
  compl:  "https://pub.dev/packages?q=",
};
searchEngines.pd.callback = (response) => {
  var parser = new DOMParser();
  var doc = parser.parseFromString(response.text, "text/html");
  var res = doc.querySelectorAll(".packages-item");
  return res.length > 0
    ? Array.prototype.map.call(res, (r) => {
        var repo = r.querySelector(".packages-title>a").innerText;
        var desc = r.querySelector(".packages-description").innerText;
        var score = r.querySelector(".packages-score-value-number").innerText;
        return {
          title: `[★ ${score}] ${repo} - ${desc}`,
          url: `https://pub.dev/packages/${repo}`,
        };
      })
    : [];
};

let op = "<Space>"; // Omnibar Prefix
mapSearchEngine = (alias, engine, extra) => {
  mapkey(`${op}${alias}`, `#8🔍 Search from ${engine}`, () =>
    Front.openOmnibar({ type: "SearchEngine", extra: extra ? extra : alias })
  );
};

mapSearchEngine("dd", "duckduckgo", "d");
mapSearchEngine("gg", "google",     "g");
mapSearchEngine("yt", "youtube",    "y");
mapSearchEngine("bi", "bing",       "w");
mapSearchEngine("wp", "wikipedia",  "e");

Object.values(searchEngines).forEach((item) => {
  addSearchAliasX(
    item.alias,
    item.engine,
    item.url,
    "s",
    item.compl,
    item.callback
  );
  mapSearchEngine(item.alias, item.engine);
});

// --------------------
// Quick open website
// --------------------
openLink = (url, tabbed) => () => {
  RUNTIME("openLink", {
    tab: {
      tabbed: tabbed,
    },
    url: url,
  });
};

// vipga*, vipga}
quickOpenList = [
  { alias: "bl", description: "Open BiliBili", url: "https://t.bilibili.com" },
  { alias: "yt", description: "Open Youtube",  url: "https://youtube.com"    },
  { alias: "gh", description: "Open GitHub",   url: "https://github.com"     },
  { alias: "wb", description: "Open Weibo",    url: "https://weibo.com"      },
  { alias: "pi", description: "Open pixiv",    url: "https://www.pixiv.net/" },
  { alias: "tb", description: "Open Taobao",   url: "https://taobao.com"     },
  { alias: "jd", description: "Open JD",       url: "https://jd.com"         },
  { alias: "tw", description: "Open Twitter",  url: "https://twitter.com"    },
  // { alias: "",   description: "Open ",         url: ""                       },
];

// mapping
let qoit = "oo"; // Quick Open Website in new tab
let qoct = "ok"; // Quick Open Website in current tab
quickOpenList.forEach((n) => {
  mapkey(
    `${qoit}${n.alias}`,
    "#6" + n.description + " in new tab",
    openLink(n.url, true)
  );
  mapkey(
    `${qoct}${n.alias}`,
    "#6" + n.description + " current tab",
    openLink(n.url, false)
  );
});

// --------------------
// domain specific prefix
// --------------------
// Base function
btnClick = (clzName) => {
  var btn = document.querySelector(clzName);
  if (btn) {
    btn.click();
  }
};

cbSwitch = (clzName) => {
  var sw = document.querySelector(clzName);
  if (sw) {
    sw.checked = !sw.checked;
  }
};
const dsp = "D";

// bilibili
const biliActions = {};
biliActions.play = () => {
  btnClick(".bilibili-player-video-btn");
};
biliActions.webFullscreen = () => {
  btnClick(".bilibili-player-video-web-fullscreen");
};
domain_spec_mappings = [
  {
    domain: /bilibili\.com/i,
    mappings: [
      {
        alias: "D",
        description: "BiliBili - start / pause",
        action: biliActions.play,
      },
      {
        alias: "F",
        description: "BiliBili - toggle web fullscreen",
        action: biliActions.webFullscreen,
      },
    ],
  },
];

domain_spec_mappings.forEach((de) => {
  de.mappings.forEach((e) => {
    mapkey(dsp + e.alias, e.description, e.action, { domain: de.domain });
  });
});

// Remove annoying settings
const unmaps = {
  // unmap all proxy
  mappings: [
    "cp",
    ";cp",
    ";ap",
    "zQ",
    "zz",
    "yp",
    "<Ctrl-j>",
    "<Ctrl-h>",
    // proxy
    ";pa",
    ";pb",
    ";pd",
    ";ps",
    ";pc",
  ],
};
unmaps.mappings.forEach((m) => {
  unmap(m);
});

// NOTE
// goto chrome://extensions/shortcuts to add shortcuts
