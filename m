Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=DrrZqvVh4HB9x8SlpgHuKvTBQWea5QflQUvR1wtorrE=;
 b=kbqu4HQWLenzYEeCX0gUZNZzK8/WpQkNpCIpT8c+lKFZMOPVkmsMXmfQUV+CiX+ts3
 P6DMnV64vThY/5CROCE43hocwgef+oR3b0Q4cBVpmGGE4EtJn13oZ+z3h1Lr1ezyQthP
 APWwd0tBxxdVl70yao3NReIVFihj0mnGWNk5ueOmT16JrnZGvwTKB6X1KgVIWnEeH5bB
 9BuwybH3xMdIbRcssz7pt44sVstGluRUj45TzObwajSvvOgm6ACpp3fiJAh5APRq0Xrs
 wgnNz9P4XWL9Xu92H8RZozz1YhowAiCJ5+dqOZG42IJd9nMuVV6ZJw8o2+1IUb7m7x20
 +miQ==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 2/3] memorder: Fix wrong function reference
Date: Wed, 20 Sep 2017 00:34:55 +0900
Message-Id: <20170919153456.10274-2-sj38.park@gmail.com>
In-Reply-To: <20170919153456.10274-1-sj38.park@gmail.com>
References: <20170919153456.10274-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 memorder/memorder.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 820e718..85ba46e 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -1714,7 +1714,7 @@ where ``IRIW'' stands
 for ``independent reads of independent writes''.
 Because this litmus test uses only one variable,
 \co{P2()} and \co{P3()} must agree
-on the order of \co{P0()}'s and \co{P()}'s stores.
+on the order of \co{P0()}'s and \co{P1()}'s stores.
 In other words, if \co{P2()} believes that \co{P0()}'s store
 came first, then \co{P3()} had better not believe that
 \co{P1()}'s store came first.
-- 
2.10.0

