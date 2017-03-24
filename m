Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=BWhwWDrhSbcLNnFimDR2hXHyZEuToHXhNA9akLzIauk=;
 b=G5gptF3iMhwZGqvmgSbYQJRonRWoPREa2rH+3rXbHovIdIBf34yTCTVGE9LRwl1mCB
 3HyPz34DduC7cozlezgsUvI2/vHY2YuUSv5MYyvocD3yyq5CFokNYoz2SyhfYxrmOrcQ
 u/p8TBwpAfBIzUgOD06T8QJA+UPPYNOR9nLmDAbYiqWUZqNhmG1I82y1mkSCYZLGlAxq
 IGYbNZahxIih+0CjnQk9sM8d1Pbb5BnQafPs0n7n/+QJska3nYBnLU3avr88tubii5yD
 xcd0FMNP3SaL/xGE+IOLKaRf3LCxZ7pg46c+BkueZ64l2kviFok7k7uv2p/CNUzIeNvA
 0QRA==
Subject: [PATCH 1/2] FAQ-BUILD.txt: Typo fix
References: <d4e3f6ba-bdc9-fa85-7404-f189adfb6436@gmail.com>
 <20170323153558.GD3637@linux.vnet.ibm.com>
 <c7a6f457-3914-9e5e-a42a-29e9b8f67b77@gmail.com>
 <d0f3c29f-3607-9175-f357-d9b546437745@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <e7d8b68f-ce3f-ecd2-d39c-1e76003a6513@gmail.com>
Date: Fri, 24 Mar 2017 22:19:46 +0900
MIME-Version: 1.0
In-Reply-To: <d0f3c29f-3607-9175-f357-d9b546437745@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 29f2c51a3a0f1a970a8665df15961d3c9a400a57 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 24 Mar 2017 20:36:40 +0900
Subject: [PATCH 1/2] FAQ-BUILD.txt: Typo fix

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 FAQ-BUILD.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index a47eef6..85a79f7 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -107,7 +107,7 @@
 		Note: If available, you can use the <package>.tds.zip,
 		which will automatically put the files in the relatively
 		right place. Note that font packages should be copied to
-		the TEXMFLOCAL directory rather than to the TEXFMHOME
+		the TEXMFLOCAL directory rather than to the TEXMFHOME
 		directory.

 		Following is a list of links to optional packages as of
-- 
2.7.4


