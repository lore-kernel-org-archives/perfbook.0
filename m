Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=cBCAc7WBW1IXz1UD77Z4RwqUHZoevIf7rL845PVnt4o=;
 b=K5P/Tq4tP9dScfvr4t7n2dn3F4Op6UchpzPsta2YZ5pDirH7vYJPgk/t5iZferdFkS
 1nmbaH3rF7J5BQH9WNrNcFlLaHo82peyCoMq4Jp46lXipFV3grWoMB1DszhnDneFqSI/
 +JQT1Kt+7als03jlvjqRkX9ZqutgzdfmCO4gt788eIU8pBJjOO0j+5A0vefvPHQ0a9cV
 vZwB0zkH6sW9agCeS5FDjbf7yhOhZ/k4B2PZBSV67SHwa6lWISKiNbKDGK2vWQjYfa5F
 0sUz58IYac7OqZ9ydOvCB7wc3PG0bPJsJWyO9ld2/okRxMpcTcPi0zsGTMhDmTEgQKqB
 k4sA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/5] Layout tweaks for 2c layout
Message-ID: <8fc83317-ec1d-da55-526a-fe63d5233df0@gmail.com>
Date: Fri, 27 Jan 2017 00:16:51 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 15aea071f9a8ff33b0f97310b2afd4730d33afa1 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 26 Jan 2017 23:25:08 +0900
Subject: [PATCH 0/5] Layout tweaks for 2c layout

Hi Paul,

This is *not* a bibliography update.

Because of wide textwidth for two-column layout, the cover page, legal
section, and TOC, which are one column, looks too wide.

Patch 1 adds an explicit line break before "What" in the title. Another
candidate might be before "And, If So,", but I think this looks better.

Patch 2 narrows effective textwidth of legal section and TOC as the same as
that of one-column layout by using "changepage" package.

Patches 3 and 4 can be regarded as a workaround of build error in 2c layout
when "inlinelinks" is enabled. By using one-column layout for bibliography,
the issue can be avoided. Also, wider column width permits freedom in
typesetting of "alpha" style bibliography. The effective textwidth for
bibliography is a little wider than the one-column one considering indent
of entries. You might want to skip patch 4 which enables inlinelinks, but
as far as I could test by choosing varieties of monospace fonts, there was
no build error caused by hyperlinks in bibliography.

Patch 5 tweaks parameters for placement for floating objects. In two-column
layout, when a not so tall figure occupies a column, it looks imbalanced
if the neighboring column is flushed from top to bottom. By increasing
"floatpagefraction", such placements can be prevented.

Please give it a try and let me know what you think.

                                            Thanks, Akira
--
Akira Yokosawa (5):
  Specify line break in title of cover page
  Narrow textwidth of legal and TOB pages in 2c build
  Change bibliography to one-column layout in 2c build
  Enable inlinelinks for 2c build
  Increase floatpagefraction for 2c layout

 appendix/appendix.tex |  6 +++++-
 legal.tex             |  4 ----
 perfbook.tex          | 13 ++++++++++++-
 3 files changed, 17 insertions(+), 6 deletions(-)

-- 
2.7.4

