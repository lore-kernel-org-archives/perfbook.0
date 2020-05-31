Return-Path: <SRS0=wHCD=7N=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=8cN+aYWP6IsljbG5Mb07lL7sbejNJ7coH8ZAk+RymNM=;
        b=OWyXejSRc7S82add7wtU5PPSRasNGC9rOwLOaCmx+Y5Ma5P7EzP1wOcQoVTC7ukBCg
         01SZ+EUZl6WLTxS1CG2lLNEZLPKaTdsdVpPOGTbmu76DQuDbfV8wfcrcd0bd75OpcY70
         iZY/EPFqSrdF8iEG4UQ7V4qX4Xwz2rt9FKS2Jg4iI1fMUiKOmuHpitLsMxKklLnW2Uu6
         Z0wb2OTLw3LYVbdigT1YQOucyD8zM2kdjx0ZMQgXLyYywncBJOz2yvu5NfJzFNBWsJZY
         zeoqxKjRybpCDU7m3gLyeLHvClwfjIyjVYUmh457O4uRRkNaydbNLmgHL0FHCfkvE593
         f67w==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/3] defer: misc updates
Message-ID: <64483a19-eee6-f406-7456-01feb232d019@gmail.com>
Date: Sun, 31 May 2020 09:30:44 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

This is misc updates in response to your recent updates.

Patch 1/3 treats QQZ annotations for "nq" build.
Patch 2/3 adds a paragraph in #9 of FAQ.txt.  The wording may need
your retouch for fluency.
Patch 3/3 is an independent improvement of runlatex.sh.  It will avoid
a few redundant runs of pdflatex when you have some typo in labels/refs.

Another suggestion to Figures 9.25 and 9.29.
Wouldn't these graphs look better with log scale x-axis?

X range can be 0.001 -- 10.

You'll need to add a few data points in sub-microsecond critical-section
duration to show plausible shapes in those regions, though.

        Thanks, Akira
--
Akira Yokosawa (3):
  defer: Annotate consecutive QQZs as such for 'nq' build
  FAQ.txt: Advertise 'nq' build in #9
  runlatex.sh: Give up early on undefined refs

 FAQ.txt               |  8 ++++++--
 defer/rcuusage.tex    | 20 +++++++++++---------
 utilities/runlatex.sh | 42 +++++++++++++++++++++++++-----------------
 3 files changed, 42 insertions(+), 28 deletions(-)

-- 
2.17.1

