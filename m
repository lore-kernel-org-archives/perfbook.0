Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3Yjrk3ix1JT3r/F+rQLSLxvO/aKPeDPShi4chp2OLXw=;
 b=EFDQNih0lDJ9TX3rh/1TMP/2qsJDZqnoCUyWYkSBMsSDmvuHuo1FGNmqWYGiQbLi8S
 lkuBSn1+SUYo0UCeG7uo7A6sWU8PZdOBKpch4esxai5PXWAh8XY3gcJm32GvndDy4HFj
 tfImA5xGq5fHnenlOfJr82g4pa0colHBpFkDKR1rNwllGb9hZm2dxq9XQjSSeuu1IY4U
 u2ihEMGR9zciMe25CPE3k3XAJBk1gMwbh/1ArjJNSfWC31uQW7YZQFW9onSl8rpFhoYA
 zXkQckis15pE2ZCEgxupl47EogxH7MdpAuNBn0ZqsNCVLRUxUJyUMXBPI+p4wumgDEJu
 0+NQ==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 06/17] formal/spinhint: Reference figure
Date: Wed, 21 Sep 2016 11:44:37 +0900
Message-Id: <20160921024448.24744-7-sj38.park@gmail.com>
In-Reply-To: <20160921024448.24744-1-sj38.park@gmail.com>
References: <20160921024448.24744-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 formal/spinhint.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index 878fa61..ec53a7f 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -1096,7 +1096,7 @@ to 0 (so that line~14 will fetch the second counter).

 With the \co{sum_unordered} macro in place, we can now proceed
 to the update-side process shown in
-Figure.
+Figure~\ref{fig:analysis:QRCU Updater Process}.
 The update-side process repeats indefinitely, with the corresponding
 do-od loop ranging over lines~7-57.
 Each pass through the loop first snapshots the global {\tt readerprogress}
-- 
2.10.0

