Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:references:cc:to:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=jb+Y7LgPVyRWGOoMCFTml5vP0tIKgUbcVOetzv/L0G8=;
 b=TvWAoEGHRM/oZ8W4KuCYgGdyrr8/9vJNInQZ2B0Ch7+DwxhczqGhRZY6cRsbE+J20J
 PQV1N4lsS6Dp66gSaR+lrR6UbYsIqP/2Tu+dt8YwX51b5hDJ29+7gkIduXpbcG2xHe0b
 qnf27Af8LzrDaOAWez9oJZa6yOcxzft1mRxGWnn1MCV2OQNskWx3RuY+4gqN6EazUUc8
 9Z8jjhm8XODUzdDglSlls97VuourKLpKeEewgulxLkZiIZ2RFAOXjUzVcmX0M8ks89vj
 0Jsdmk1GIzoliTBT9r/r6S+m6GI5LjUnA1oa7ZCwHLrsykYHE9uDhU/dMObDHcY9gchc
 LvdQ==
Subject: [PATCH v4 0/2] Follow up patches to FAQ-BUILD update
References: <d4e3f6ba-bdc9-fa85-7404-f189adfb6436@gmail.com>
 <20170323153558.GD3637@linux.vnet.ibm.com>
 <c7a6f457-3914-9e5e-a42a-29e9b8f67b77@gmail.com>
 <20170324181239.GJ3637@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <18798da1-60ed-a6b4-0a7b-e53a9f3b7fc0@gmail.com>
Date: Sat, 25 Mar 2017 08:00:58 +0900
MIME-Version: 1.0
In-Reply-To: <20170324181239.GJ3637@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From e2ffbd35e5a1121b953a2f7073ee50d6efc58cd3 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 25 Mar 2017 07:55:41 +0900
Subject: [PATCH v4 0/2] Follow up patches to FAQ-BUILD update

Apologies. There was still a typo in v3. (v3 was aborted)
Let me try again.

                             Thanks, Akira
--
Akira Yokosawa (2):
  FAQ-BUILD.txt: Fix misinformation crept in wordsmithing
  Add another build error check

 FAQ-BUILD.txt              | 11 ++++++-----
 utilities/runfirstlatex.sh |  6 ++++++
 utilities/runlatex.sh      |  6 ++++++
 3 files changed, 18 insertions(+), 5 deletions(-)

-- 
2.7.4


