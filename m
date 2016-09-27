Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Lx6i8c/xPe36pm8sCiNDTJJeMMNdOtltFE5XYdqix/g=;
 b=GxykhxwikISwg5xmmn8RZeIJleihFBguHCqcxVKcNZjCTWqS0FnRcibW+7Sc277lNf
 qs2ZIeyqvLa/h0Nk+wYiESlyWA5RLCllLXMg8D0tIBxgEuT7GFhBMUSCxUny/8h9Yrfw
 Q31MxLAF28iRNqVpZquz0wYI3vTsWr+Q108JGht5xYeGK1jXLPaU5h95FfigZZJu5Wm6
 nzrYM8X7IKOA8RhLVJzSlmC9tWGJIriyJQ5wOGyO4NkPNWzRebhQSYRdMl+3+/4MI0e1
 06UmiTCzXaouMOMBOUDPD8Dnn2FYp5bgkTvrNsqD1lUU6NllKfRqD62FFkZdGObOYxLr
 xY0Q==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH v3 09/17] formal/dyntickrcu: Fix typos
Date: Wed, 28 Sep 2016 06:56:33 +0900
Message-Id: <20160927215641.7330-9-sj38.park@gmail.com>
In-Reply-To: <20160927215641.7330-1-sj38.park@gmail.com>
References: <20160927215641.7330-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: akiyks@gmail.com, perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Suggested-by: Akira Yokosawa <akiyks@gmail.com>
Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 formal/dyntickrcu.tex | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
index 5ede587..bbbdb18 100644
--- a/formal/dyntickrcu.tex
+++ b/formal/dyntickrcu.tex
@@ -886,10 +886,10 @@ results in failure, as line~23 is checking that the wrong variable
 is even.
 Upon failure, \co{spin} writes out a
 ``trail'' file
-(\path{dyntickRCU-base-sl-busted.spin.trail})
-file, which records the sequence of states that lead to the failure.
+(\path{dyntickRCU-base-sl-busted.spin.trail}),
+which records the sequence of states that lead to the failure.
 Use the {\tt spin -t -p -g -l dyntickRCU-base-sl-busted.spin}
-command to cause \co{spin} to retrace this sequence of state,
+command to cause \co{spin} to retrace this sequence of states,
 printing the statements executed and the values of variables
 (\path{dyntickRCU-base-sl-busted.spin.trail.txt}).
 Note that the line numbers do not match the listing above due to
-- 
2.10.0

