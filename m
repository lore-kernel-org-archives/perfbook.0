Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=xA4C7fn2hEegUDclfjpSHrfe/voK3frrjAIVeaMNV5w=;
 b=etSQajbhoWcEYbWMgsux7mYvxHksBF0c7QpzO+q9XV7rz+QAJ0vGo0MgwL5xXpFw8z
 Vg8nrN7B968SzGkxxzXmrBFWvy4ansJH3gLTUDe4nbeArfEo+D6hnhHRm895m61JO47b
 TlOZZ+LCaC1uIDS/PXi93acrg7PcYIJiZef/jT/HubGmlMJhV6UM6gAgqxdWROG5FC35
 5b7+bCA7VQTAIxDtWDXVghipJbFrMHAlhDBwMM2GSNaWG9CWaT9vlDU0eroxfg37wT9I
 LmhRF0lT5bRyVzlzJrcya/pYr7py+ehSca7lm338QkeKL0By1voeCXLj4pt4mXpeLKuN
 /iTw==
Subject: [PATCH 2/2] advsync/memorybarriers: Fix trivial typo
References: <729a5146-a533-0511-d3a0-88ca20a10106@gmail.com>
 <20161223185842.GB3742@linux.vnet.ibm.com>
 <c7b39cad-90b4-140b-1e62-8d4ddc84f8ff@gmail.com>
 <20161224002217.GE3742@linux.vnet.ibm.com>
 <4d1151a1-49c0-45ad-e4fb-5ee8120e352e@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5ddd03ce-4529-f3a9-bb24-aff7f2299ff9@gmail.com>
Date: Sat, 24 Dec 2016 13:25:29 +0900
MIME-Version: 1.0
In-Reply-To: <4d1151a1-49c0-45ad-e4fb-5ee8120e352e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 0d9a7906973a76ffa56cf1251a01b3708b9eb283 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 24 Dec 2016 12:34:12 +0900
Subject: [PATCH 2/2] advsync/memorybarriers: Fix trivial typo

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index b344364..b8bc611 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -1947,7 +1947,7 @@ transform the above code into the following:
 \scriptsize
 \begin{verbatim}
  1 q = READ_ONCE(x);
- 2 WRITE_ONCE(y, 1);
+ 2 WRITE_ONCE(y, 2);
  3 do_something_else();
 \end{verbatim}
 \end{minipage}
-- 
2.7.4


