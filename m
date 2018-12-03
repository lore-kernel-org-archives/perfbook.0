Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=nXnEj2uXyBsSUYiXw/aBnRzYgEgT3qZKMg0xURR8l0Y=;
        b=OkkT/EKx8ZMihiAVIMB8lJZ93is5s0bDPtU9rxntebS2sp5FTMXpVawyFJ6spjnSZV
         hKdpoA0u71uQTrgsHryY7sXTcE22UsTbVIq3filZGhkAjro86xhuUmbL93Ju6MXEeoB6
         yW/VBTBq3Gu6ylN3W8LO/iAsBxVviz7H9EiwNrmsvU7bDQvHnlmpa7jJqodnVomrsI31
         kcQxjmXfSRq+qy7TudtHkCVi+cHD9/krZzIbnufQOdpBQxtkmspn3YY5LkWSl6rDMzP+
         VkOhHzvOqpljSsC6BubwfbhQFYR79LCcypfJGbjswacRMOeoamyGxakgEgdbSW1DJZST
         dgwg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/6] defer: Employ new scheme for code snippets (cont.)
Message-ID: <c5c96e55-3106-1580-2930-c2f5168a7a79@gmail.com>
Date: Tue, 4 Dec 2018 00:33:32 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

This is a followup patch set to update remaining code snippets
in chapter "defer".

My first thought was that patches #5 and #6 might conflict with
upcoming updates to reflect consolidation of RCU flavors, but it
looks like these code snippets are unlikely to be affected.

Patch #1 assumes that you intentionally presented a different
set of hazptr API from the one used in hazptr.h.

        Thanks, Akira
--
Akira Yokosawa (6):
  defer: Employ new scheme for 'lst:defer:Hazard-Pointer Storage and
    Erasure'
  defer: Employ new scheme for snippets of route_hazptr.c
  defer: Employ new scheme for snippet of seqlock.h
  defer: Employ new scheme for snippets of route_seqlock.c
  defer: Employ new scheme for snippets in rcuintro and rcufundamental
  defer: Employ new scheme for snippets of route_rcu.c

 CodeSamples/defer/route_hazptr.c  |  50 ++--
 CodeSamples/defer/route_rcu.c     |  75 +++---
 CodeSamples/defer/route_seqlock.c |  56 ++--
 CodeSamples/defer/seqlock.h       |  55 ++--
 defer/hazptr.tex                  | 168 +++---------
 defer/rcufundamental.tex          | 381 +++++++++++++--------------
 defer/rcuintro.tex                |  13 +-
 defer/rcuusage.tex                | 523 ++++++++++++++++----------------------
 defer/seqlock.tex                 | 259 ++++++-------------
 9 files changed, 637 insertions(+), 943 deletions(-)

-- 
2.7.4

