Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=0h9fr7UQ5s53471IvplLJCL24wR3dQdnKRzHB21PLBQ=;
        b=Xc4tm27QzqY8zHisptA4Q7S6qQ2G8dTK2UysOPaRVEJS9BUXWZdFfh1z8IXkqdyJf7
         EgxSxMC3Om7tnXTDdCfovV9xGGdUhDFeX+dCT5x+8zC/DvuOwFiPM2TtomQueVZLcHYS
         k4AMHRrdkkTJGnIjhxD5W/AY8TEYasD1OtHJDzrSNmfLNZn3FipoLeL/355vnyn6W/qJ
         FuHfndpAdeZWNpW5Nuv1bf0VwTANShg/kClCofGCNnHaPotFT4CH4ROyR+jI7iQ6iK+K
         6MKbmK3zGdiZmcBKe6gJCPCDqwZ07oZ1GPqFXGQ0BxPprISayg9tUOfmrEfOETJRd0kT
         8RIQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/3] Employ new scheme for code snippets (cont.)
Message-ID: <1c49a5ed-290f-f81c-a768-b2d5d2450b43@gmail.com>
Date: Sun, 25 Nov 2018 23:44:41 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 4ebe85f38ed5f0e003847854b64bc8773bec8ebb Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 25 Nov 2018 23:30:16 +0900
Subject: [PATCH 0/3] Employ new scheme (cont.)

Hi Paul,

This is a set of patches to further apply the new scheme for snippets in
chapters "owned" and "defer". Further updates in "defer" will be submitted
shortly.

        Thanks, Akira
--
Akira Yokosawa (3):
  owned: Employ new snippet scheme
  defer: Employ new snippet scheme for route_seq.c
  defer: Employ new scheme for snippets of route_refcnt.c

 CodeSamples/defer/route_refcnt.c |  67 +++++++++--------
 CodeSamples/defer/route_seq.c    |  42 +++++------
 defer/defer.tex                  |  76 ++++----------------
 defer/refcnt.tex                 | 152 +++++++++------------------------------
 owned/owned.tex                  |  19 ++---
 5 files changed, 115 insertions(+), 241 deletions(-)

-- 
2.7.4

