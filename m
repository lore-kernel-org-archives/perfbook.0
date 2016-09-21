Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=S5GUNANf4O+aIvs2Mf7YFka1z1k2d3RGH9105uA3eFI=;
 b=zJi9Ki5ILdnBuPxh4U/RYoL7UGnaTFEzwMxMaqV0NGUBHtFrsjzSGdSZQ+VFB29WBI
 iHmMLYlzJqA4Rkwk78H9GKn27h2fcLjfUQW4f1N9aSDlqSe0QT8ZzawqVRMkOw3NHYrN
 aT9FbiiAgSLfsgyqqaG673yQw3YfRU4M1GK3nIfbbusHj/NpEwBISE+blvXdWSUZzrSk
 HIQ8AF/T1D21dwCeSz3XaR9tdXVMkGz8Bfoh7SPYut3vPLraYeWIG8WRS3EnwccIIr1g
 UVt37GPJ0b6FHBk15w/gTKX0+oujNy+pNu9Bt1ZGtyGJ/vyg7dUCdOG41GDUgTkmyswp
 5i9A==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 09/17] formal/dyntickrcu: Fix typos
Date: Wed, 21 Sep 2016 11:44:40 +0900
Message-Id: <20160921024448.24744-10-sj38.park@gmail.com>
In-Reply-To: <20160921024448.24744-1-sj38.park@gmail.com>
References: <20160921024448.24744-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 formal/dyntickrcu.tex | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
index 5ede587..1d3e155 100644
--- a/formal/dyntickrcu.tex
+++ b/formal/dyntickrcu.tex
@@ -213,7 +213,7 @@ Line~3 fetches the current CPU's number, while lines~5 and~6
 increment the \co{rcu_update_flag} nesting counter if it
 is already non-zero.
 Lines~7-9 check to see whether we are the outermost level of
-interrupt, and, if so, whether \co{dynticks_progress_counter}
+interrupt, and, if so, \co{dynticks_progress_counter}
 needs to be incremented.
 If so, line~10 increments \co{dynticks_progress_counter},
 line~11 executes a memory barrier, and line~12 increments
@@ -887,9 +887,9 @@ is even.
 Upon failure, \co{spin} writes out a
 ``trail'' file
 (\path{dyntickRCU-base-sl-busted.spin.trail})
-file, which records the sequence of states that lead to the failure.
+, which records the sequence of states that lead to the failure.
 Use the {\tt spin -t -p -g -l dyntickRCU-base-sl-busted.spin}
-command to cause \co{spin} to retrace this sequence of state,
+command to cause \co{spin} to retrace this sequence of states,
 printing the statements executed and the values of variables
 (\path{dyntickRCU-base-sl-busted.spin.trail.txt}).
 Note that the line numbers do not match the listing above due to
-- 
2.10.0

