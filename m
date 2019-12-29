Return-Path: <SRS0=/5BA=2T=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=tsV1uAVLlLjQuIsKeyYQyuamw7z+0E4fG/e8LfaYMeg=;
        b=HPhBP8Ir5NuDSXZMPoUCTO3J2EZSTWYzUTE3JTecJvX9gJiL49craqg6G+BzJ8nYNe
         /RuI1rLaILmQA6p8TxCbNJ05czrUrSAC6h3tBumVK5VP261b0YAGE/K3jbXV3kWq4lEj
         7r1rJ4EagxY3h/d2SfWTI1+jpge6bTstBZxKEN3tnk6HTqWuS1Bg2I43mxLSCHiQie7u
         UnlLtaQ7+eoOqL4pBBuE79AEv8QUZ+li58L+uVucXrT/4KRP3wKEkRXM+LsnXX13lA1Q
         kT9K882XKMYYjbcGtJ73lqRVfg4MCqFJBQBrU37jGlcb44g5bVrJcRQD5At4F1aFL8fj
         bGRw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/3] Improve autodate.sh
Message-ID: <861d7415-b129-5d98-b28c-1988bc2359a4@gmail.com>
Date: Sun, 29 Dec 2019 19:21:42 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This patch set was inspired by your change log of commit 686915e83f79
("utilities/autodate: Convert current tag to release/edition text")
saying:

    This should really use a canned library to convert numerals to
    English-text ordinals, but none of the ones I found worked as advertised.

My guess is the ones you found are assuming bash and don't work with
dash. You know, dash doesn't handle arrays.

Patch #1 is my answer and delegates the handling of ordinals to
a LaTeX package "fmtcount".
Patch #2 is a minor update so that a repository with untracked files
is treated as clean.
Patch #3 expands the use of tag info and displays it on every page
at the bottom-right corner.

        Thanks, Akira
--
Akira Yokosawa (3):
  utilities/autodate: Use 'fmtcount' package for ordinals
  utilities/autodate: Ignore untracked files in 'git status'
  utilities/autodate: Put commit-id in footer by 'draftwatermark'

 FAQ-BUILD.txt         |  6 ++++--
 perfbook.tex          |  9 +++++++++
 utilities/autodate.sh | 35 ++++++++++++-----------------------
 3 files changed, 25 insertions(+), 25 deletions(-)

-- 
2.17.1

