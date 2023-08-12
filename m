Return-Path: <SRS0=2H1n=D5=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691829706; x=1692434506;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4RXf4y4zVdFprxffUyxP+lH4uRzmbdfzJnYe7qaPbE=;
        b=nOscP11yt3gm06TUYOI8INQwkC+s05zCcpI32ww3uMp+lPdM0UJVbpxNcM96HU0wEB
         o9GUIqbc17Y70vc386smFcGsAPhMmWKau19VbgoynYMjiCUfkrgjNQawFFrprd+YiMDO
         eDwT21hudvQMEc21403WtVxh6fDkUO31ICW4nBdaoPuVfd46wF+lwvyVzp7/UPwo4Ccl
         ieMKdPKrquKrFazorL+PI75FLCfCglh+3o+vFslqiY/jRV/nNwJR6bYCpTkEfBFR0+px
         i2+cn6iBiCN3ncm9vTbThw7RwpN7sJclHD9WLWdXFdFhHsfRnG0ifDkzl53I5XYhypXU
         UEcw==
Message-ID: <bfc20978-26e4-8fa1-28a7-894dc8728615@gmail.com>
Date: Sat, 12 Aug 2023 17:41:36 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 1/4] bib/hw: Update CSIRAC entries
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Museum Victoria Australia's web site was reorganized in 2020.
It has a nice "CSIRAC Collection" page now.
The page at University of Melboune was also expanded in 2017.

Update their bibliographic info.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/hw.bib | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/bib/hw.bib b/bib/hw.bib
index 164af19a5ebf..6b35552ba94f 100644
--- a/bib/hw.bib
+++ b/bib/hw.bib
@@ -145,20 +145,20 @@ and technical workloads.
 
 @unpublished{CSIRACMuseumVictoria,
  Author="{Museum Victoria Australia}",
- Title="{CSIRAC}: {Australia's} First Computer",
- year="2004",
+ Title="{CSIRAC} Collection",
+ year="2020?",
  note="URL:
-\url{http://museumvictoria.com.au/csirac/}",
- lastchecked="November 14, 2016",
+\url{https://collections.museumsvictoria.com.au/articles/3145}",
+ lastchecked="August 10, 2023",
 }
 
 @unpublished{CSIRACUniversityMelbourne,
  Author="{Department of Computing and Information Systems, University
 of Melbourne}",
- Title="{CSIRAC}",
- year="2006",
+ Title="{CSIRAC}: Our first computer",
+ year="2017?",
  note="\url{https://cis.unimelb.edu.au/about/csirac/}",
- lastchecked="February 27, 2021",
+ lastchecked="August 10, 2023",
 }
 
 @unpublished{z80Wikipedia,

base-commit: 11e363b6d3d9c6df03067807beff2262d0654a69
-- 
2.25.1

