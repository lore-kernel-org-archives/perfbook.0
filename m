Return-Path: <SRS0=u77P=RN=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=zNAqp47T6m7IHByqtcBF07DfKhaKG7NWJnziDATOSOk=;
        b=E3ZCU5xT2ZqlZZOYWBrYqZHi/Q1LvExUP4Y+wWxyx58seRfDFelhqIVh2Lw32nD18M
         6yV19oxYqbKtpioiyHtRbU389fcjb2tCJTWN8x7H7sXu82DQbkpvH/8c+6LZGKA7uYPk
         nvzyc5beGRMEELPuSeXboVfADpyHNAj7p9fpFpCEZjB/MrkV/WODH82lVNY1SWlLM6Ir
         UF5eBlqDXtRq/BJhfmOHNTXOu5rabnvlQkUBWdXrYgvJQo6SPBJTLLcl31l3A6PS+w0N
         0sSVooEvVx4uLQBX5bhqOMBONPZbqaujD7MpOCoE6BDcMnUKEBlYSqYfMtAEa6NEhiLQ
         Rr2g==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 0/4] ebook: Improve overall page layout
Message-ID: <4fde622a-0aa3-e6df-1b20-1469ed676813@gmail.com>
Date: Tue, 28 Dec 2021 23:25:01 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

Now that the ebook-sized build is provided at the landing page,
I am trying to improve its overall looks.

Here are a couple of minor issues as of current master:

 1) In TOC, page counts larger than 999 don't align properly.
 2) Page counts are invisible (printed out of paper area).
 3) Chapter headings are too large for ebook size.

Patch 1/4 resolves issue #1.
Patch 2/4 restores page counts in a way not that distracting.
This is done by the help of the fancyhdr package.
Patch 3/4 changes chapter-wise epigraph position to below chapter
heading.  This looks better in ebook-sized builds and avoids
conflict between fancyhdr and epigraph packages.
Patch 4/4 resolves issue #3.

        Thanks, Akira
--
Akira Yokosawa (4):
  ebook: Allocate enough width for four-digit page counts in TOC
  ebook: Print page counts on upper-right edge of page
  ebook: Use normal epigraph for chapter headings
  ebook: Reduce chapter heading's font size and spaces

 perfbook-lt.tex | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)


base-commit: 204f9c99b8c56f68b0e6c7ffb8d63f7699643c1a
-- 
2.17.1

