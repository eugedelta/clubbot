<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" indent="yes" encoding="UTF-8" />

  <xsl:template match="/">
    <html>
      <head>
        <title>Sitemap — Delta Work</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <style>
          *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
          body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: #FAFAFA;
            color: #212121;
            padding: 48px 24px;
            line-height: 1.5;
          }
          .container { max-width: 960px; margin: 0 auto; }
          h1 { font-size: 28px; font-weight: 600; margin-bottom: 8px; }
          .subtitle { font-size: 14px; color: #666; margin-bottom: 32px; }
          table {
            width: 100%;
            border-collapse: collapse;
            background: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 1px 3px rgba(0,0,0,0.08);
          }
          thead { background: #f5f5f5; }
          th {
            text-align: left;
            padding: 12px 16px;
            font-size: 11px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            color: #666;
            border-bottom: 1px solid #e5e5e5;
          }
          td {
            padding: 12px 16px;
            font-size: 13px;
            border-bottom: 1px solid #f0f0f0;
          }
          tr:last-child td { border-bottom: none; }
          tr:hover td { background: #fafafa; }
          td a {
            color: #F07059;
            text-decoration: none;
            word-break: break-all;
          }
          td a:hover { text-decoration: underline; }
          td.priority { font-weight: 500; color: #666; text-align: center; width: 80px; }
          td.changefreq { text-transform: capitalize; color: #666; width: 100px; }
          .footer { margin-top: 24px; font-size: 12px; color: #999; }
        </style>
      </head>
      <body>
        <div class="container">
          <h1>Sitemap</h1>

          <!-- URL set view -->
          <xsl:if test="//*[local-name()='urlset']">
            <p class="subtitle">Delta Work — <xsl:value-of select="count(//*[local-name()='url'])" /> pages</p>
            <table>
              <thead>
                <tr>
                  <th>URL</th>
                  <th class="changefreq">Frequency</th>
                  <th class="priority">Priority</th>
                </tr>
              </thead>
              <tbody>
                <xsl:for-each select="//*[local-name()='url']">
                  <tr>
                    <td>
                      <a href="{*[local-name()='loc']}" target="_blank">
                        <xsl:value-of select="*[local-name()='loc']" />
                      </a>
                    </td>
                    <td class="changefreq">
                      <xsl:choose>
                        <xsl:when test="*[local-name()='changefreq']">
                          <xsl:value-of select="*[local-name()='changefreq']" />
                        </xsl:when>
                        <xsl:otherwise>—</xsl:otherwise>
                      </xsl:choose>
                    </td>
                    <td class="priority">
                      <xsl:choose>
                        <xsl:when test="*[local-name()='priority']">
                          <xsl:value-of select="*[local-name()='priority']" />
                        </xsl:when>
                        <xsl:otherwise>—</xsl:otherwise>
                      </xsl:choose>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
          </xsl:if>

          <!-- Sitemap index view -->
          <xsl:if test="//*[local-name()='sitemapindex']">
            <p class="subtitle">Delta Work — <xsl:value-of select="count(//*[local-name()='sitemap'])" /> sitemap(s)</p>
            <table>
              <thead>
                <tr>
                  <th>Sitemap</th>
                </tr>
              </thead>
              <tbody>
                <xsl:for-each select="//*[local-name()='sitemap']">
                  <tr>
                    <td>
                      <a href="{*[local-name()='loc']}" target="_blank">
                        <xsl:value-of select="*[local-name()='loc']" />
                      </a>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
          </xsl:if>

          <p class="footer">Generated from sitemap.xml</p>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
