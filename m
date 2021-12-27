Return-Path: <SRS0=M9fC=RM=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ZOga63yBt1UkdIV/5uCPQ12+uMyJ39CC0KZVN29px5I=;
        b=mARGHQT9j+TvB7QZQUVgjmkZ/5Pk2ePu+Tdtd7S+uxksZYj8z3F+Sq6ZaCLLo1NxoZ
         Se6ZGsWlb0ek+76yH8NYZmck5EAFZ2orao/wC2VPzWx/pbc6qfCf4n5Y0VxY6bNNDfmd
         LENy/wGYcs6bE7Nzx/xoXXht5+Kxu4jHHz695ILWEwgrp6ofaKVgWyxa8M1U2GKyf8wK
         3CA1aJl5Ee7WPxLh7aaLyS9Tlb+DNj7tfiULK27ib9COTwhY3bHR+JGeHVyiJ4QVb0MQ
         oXgsvrbZRRZ2odrvQKLwo1v2nE+NoONePB3eLEU5y7iAbuL+85E0sZRTxop6K08BFAll
         VJQg==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 2/2] count: Add missed parentheses for balance_count()
Date: Mon, 27 Dec 2021 09:52:13 +0100
Message-Id: <20211227085213.9246-3-sj38.park@gmail.com>
In-Reply-To: <20211227085213.9246-1-sj38.park@gmail.com>
References: <20211227085213.9246-1-sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

A sentence in count/count.tex doesn't append parentheses for
balance_count().  Let's add it so that it can be more consistent.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 count/count.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/count/count.tex b/count/count.tex
index 7d7701ff..c8aa959b 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -1682,7 +1682,7 @@ Finally, in either case,
 
 It is helpful to look at a schematic depicting how the relationship
 of the counters changes with the execution of first
-\co{globalize_count()} and then \co{balance_count}, as shown in
+\co{globalize_count()} and then \co{balance_count()}, as shown in
 \cref{fig:count:Schematic of Globalization and Balancing}.
 Time advances from left to right, with the leftmost configuration
 roughly that of
-- 
2.17.1

