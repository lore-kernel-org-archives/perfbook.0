Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xWDkHZYYB597sqlaR81RFIVjnxTjyYFOe/XN/fUEhQE=;
 b=w+h5tndL6j7tJV8qczQVMVZA8d4KdW7ar+o7eeOi1qCpMPdj02LxXnNIw5MVf6zJFm
 XXcpP9aKl/uB5tYPtDkxJSOrcLeDvfTEcGmhf/izJOKgrmj3ko+Ma3D2tdMGwjTapx0I
 vlCl4Hc9JMouLhhYxm+rs1GIFA5JP3vo5cI0zXZNKdNlLRrE43EuWQjhppaCi3XC6K7K
 uoEDqz7zqa02jjWKJ/vTxAkNjUpW98l2fVcylxBzUffygMJlLpHNDnP2RmzeRztZIgMf
 NklSHxFoln2b8tLQd5JWNHM3D1sWgTiZakuBA+lOX7BztBu1/GK4ciVpJ9WYkZ1quhH9
 bnwA==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH v3 04/17] formal/spinhint: Use \path{} for file name quotation
Date: Wed, 28 Sep 2016 06:56:28 +0900
Message-Id: <20160927215641.7330-4-sj38.park@gmail.com>
In-Reply-To: <20160927215641.7330-1-sj38.park@gmail.com>
References: <20160927215641.7330-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: akiyks@gmail.com, perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 formal/spinhint.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index e91d458..73ebe8e 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -409,7 +409,7 @@ Given a source file \path{qrcu.spin}, one can use the following commands:
 	This actually searches the state space.  The number of states
 	can reach into the tens of millions with very small state
 	machines, so you will need a machine with large memory.
-	For example, qrcu.spin with 3 readers and 2 updaters required
+	For example, \path{qrcu.spin} with 3 readers and 2 updaters required
 	2.7GB of memory.

 	If you aren't sure whether your machine has enough memory,
-- 
2.10.0

