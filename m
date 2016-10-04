Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=AmjGI4CU+B68UAnFcg1WzA9CrylY7qOrKSvfZNIVm2k=;
 b=ZUUDkmbjeVmuYBOg/Kl5CinLSxI3UjPtctJYMdsQ62D5GtpH3BPe9SBynrOjiOSvsr
 R0sLsP3tT9duxGoixpnZrweTVLYM/OHmSrrhurEo3oJkIBpjwWxcCliHZHj2CfbejMMw
 Ic/7eOUf/UEulgzfO8uxNc6pm7gCiKYRgyd178O0S+z1kewEV3Es5eBjr00AMDwFA5KE
 ur9SDVdaaYvtL0KS0rRIo3JkcQNf2xuXF7Zr0eRT6IzgSWc2wpukZ0F22HkM94Fm7Y9M
 k9zzfi+ymTwnpqqCo3QHWOvxo1ypgE8I03UMZEOaHg2/1aV4M93V37+1ueFQ7CT6yEEi
 f0hQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/3] Margin lengths and microtype tweaks
Message-ID: <fb8777a9-a5f2-ede7-69b6-8882f05cdb81@gmail.com>
Date: Wed, 5 Oct 2016 00:20:20 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From a37c36710b08dce3b4be06416a131b1f99aa327a Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 5 Oct 2016 00:00:59 +0900
Subject: [PATCH 0/3] Margin lengths and microtype tweaks

Hi Paul,

This patch series makes tiny adjustments of margin lengths
definitions and a workaround of slight miss-alignment of code
snippets caused by the use of "microtype" package.

                                        Thanks, Akira
---
Akira Yokosawa (3):
  Rewrite custom margins for hardcover
  Tweak oddside and evenside margins of onecolumn
  Disable 'microtype' in code snippets

 perfbook.tex | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

-- 
2.7.4

