function doGet() {
    const html = HtmlService.createHtmlOutputFromFile('index');
    return html.setTitle('Index Page - CI-CD Apps Script');
}
