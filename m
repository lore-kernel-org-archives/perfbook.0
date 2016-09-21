Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=cvGjbYzMCZiLOAL3mFZsXl0wG9wuJF4G6mEWMvRNAaw=;
 b=FRqZT59fE2usb9POBGXcXuh4DSgskiDVqfr/CUbTyZPMN/geKOSc6hN3YeorUvDrzF
 Y2XQfpQkugNNjjaWgjm1sjjTMXnwsvfDi6Cb2x9lsWqmDbgnor00/yvWSUMkz1gpr6rH
 wXbhTZJNijU2P14Wc7ILxXlICvQWDbtW4YNJ1VPqFp6OHnNWmv/n85BlGmC6Q9v90gGi
 VkEJYCQIJIBQ/lU13/+bMV27XxmZwRzbPERUHaepsl/EkdYVsnzxhqKddLiEtYjTfrI2
 IjlHVu22yz7/Qr+2TVr8yGQXJM13sCn1SNnyu0SSn39DL1XNxOb0XrW/sCO0CqO1c2uI
 pzUA==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 05/17] formal/spinhint: Use \co{} for variable quotation
 consistently
Date: Wed, 21 Sep 2016 11:44:36 +0900
Message-Id: <20160921024448.24744-6-sj38.park@gmail.com>
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
index 73ebe8e..878fa61 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -921,7 +921,7 @@ allows an assertion to determine when all the readers are finished
 (since a QRCU update cannot be permitted to complete until all
 pre-existing readers have completed their QRCU read-side critical
 sections).
-The readerprogress array elements have values as follows,
+The \co{readerprogress} array elements have values as follows,
 indicating the state of the corresponding reader:

 \begin{enumerate}
-- 
2.10.0

