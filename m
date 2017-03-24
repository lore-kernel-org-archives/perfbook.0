Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=references:cc:to:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=vjPZ5I0MudNDWdO8jZd6UeSZM7XK2WQyQAsZSwRv7b0=;
 b=N6s5aDi7R9DB4PvwaBl3igxwxSftxS+iqaTS7Eselna03n9Q99LuMz86ePYvtIuUoX
 SsHNs1Oky0qCfTbYhj83IZMxadWk8nNfI642ibV2mRSRfxR95oVUxOo7vqJwyqZfPQrW
 aYp2NTW2Wi03CgJ4yfm9OZnbmCSQrpELPpredq3fqh8n2jc20fAgbDC+DK6rCBU8fUoy
 TgM7vwtt/1n/176Rc/CPvG7eG20eew/27+pPkaGV5CBgLrbVso+NjknCHxJy58gaz7WI
 uVhmunL6WOasdtZ/M75IUmgcfiiPSJ8brHJ8FN7fp/ew3e6iELv+K8H+1Wky+DnOTKE/
 ZGDA==
References: <d4e3f6ba-bdc9-fa85-7404-f189adfb6436@gmail.com>
 <20170323153558.GD3637@linux.vnet.ibm.com>
 <c7a6f457-3914-9e5e-a42a-29e9b8f67b77@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/2] Follow up patches to FAQ-BUILD update
Message-ID: <d0f3c29f-3607-9175-f357-d9b546437745@gmail.com>
Date: Fri, 24 Mar 2017 22:17:43 +0900
MIME-Version: 1.0
In-Reply-To: <c7a6f457-3914-9e5e-a42a-29e9b8f67b77@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From dd65cd3918b33e9bd267661ea697b39755be72a1 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 24 Mar 2017 22:06:24 +0900
Subject: [PATCH 0/2] Follow up patches to FAQ-BUILD update

Hi Paul,

This is a nitpick patch set to the update of FAQ-BUILD.txt.

Patch 1 is a typo fix relative to the patch "FAQ-BUILD.txt:
Fix misinfomation crept in wordsmithing" I sent earlier.

Patch 2 is to detect another build error condition to happen
when you fail to update font-map database after manually
installing a font package.

                            Thanks, Akira
--
Akira Yokosawa (2):
  FAQ-BUILD.txt: Typo fix
  Add another build error check

 FAQ-BUILD.txt              | 2 +-
 utilities/runfirstlatex.sh | 6 ++++++
 utilities/runlatex.sh      | 6 ++++++
 3 files changed, 13 insertions(+), 1 deletion(-)

-- 
2.7.4


