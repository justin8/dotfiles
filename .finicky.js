module.exports = {
  defaultBrowser: "Firefox",
  options: {
    // Hide the finicky icon from the top bar. Default: false
    hideIcon: false,
    // Check for update on startup. Default: true
    checkForUpdate: true,
  },
  rewrite: [
//    {
//      // Redirect all urls to use https
//      match: ({ url }) => url.protocol === "http",
//      url: { protocol: "https" },
//    },
    {
      // rewrite http[s]://chime.aws/<meetingID> to chime://meeting?pin=meetingId>
      match: finicky.matchHostnames(["chime.aws"]),
      url: ({ url }) => ({
        ...url,
        host: "",
        search: "pin=" + url.pathname.substr(1),
        pathname: "meeting",
        protocol: "chime",
      }),
    },
//    {
//      // rewrite http[s]://quip.com/<documentID>/* to quip://<documentID>
//      match: finicky.matchHostnames(["quip-amazon.com"]),
//      url: ({ url }) => ({
//        ...url,
//        host: "",
//        search: "",
//        pathname:
//          url.pathname.split("/")[1] == "email"
//            ? decodeURIComponent(url.search).split("/")[2].split("&")[0]
//            : url.pathname.split("/")[1],
//        protocol: "quip",
//      }),
//    },
  ],
  handlers: [
    {
      // open chime: url in Chime.app
      match: ({ url }) => url.protocol === "chime",
      browser: "Amazon Chime.app",
    },
    {
      match: ({ url }) => url.protocol === "quip",
      browser: "/Applications/Quip.app",
    },
  ],
};
