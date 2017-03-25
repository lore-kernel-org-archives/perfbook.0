Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=JV1cKyET6VicYv1nLbqigmAgzDKLF7/4cePJPu8/mNE=;
 b=s4xeFyDbsJZGjH2cFmC5tsVcOlhtykKTsd2nChwQHor8h6pZcl7soTKbDL8bXXaQdh
 ZAR+HEIgyOWnogavM3vqiYm3Sab5lpPYJvJCY2eegXCBSXnUynoECcq0OJnpg9YRh1C1
 Xw9BaO0uM9dYgrkDIy+sbbTQXh+OXiGa3wI9m9k6BMrOFJpb4HTK/yB0n+prhP5st5ky
 9AV4Vss0zHCl4XNT0Qo7b/DBKkdKyhHLvJlu6CUUl6sLG76IeZqoP2TGj+N2qQhCyCkF
 gkMDBoxdo2bgkVENMA8OFcSs1jHcr7NATmlzLfVcPZnCRLe6r+VtmkdvZEsUGDkB0Trj
 HtmA==
Subject: [RFC PATCH 7/7] advsync: Avoid indent after minipage
References: <ef9bafef-1f79-ebb1-18b1-8c0adc695b4b@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <3d21c920-a610-89ed-d877-ba28df877d8b@gmail.com>
Date: Sat, 25 Mar 2017 18:42:09 +0900
MIME-Version: 1.0
In-Reply-To: <ef9bafef-1f79-ebb1-18b1-8c0adc695b4b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 461f7d8b71f955c17ce30585b301834c3ad4026b Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 25 Mar 2017 17:46:27 +0900
Subject: [RFC PATCH 7/7] advsync: Avoid indent after minipage

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index b6665b6..165b5cb 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -2511,9 +2511,9 @@ load:
 		&	<read barrier> \\
 		&	LOAD A \\
 \end{tabular}
-\end{minipage}
 \vspace{5pt}
-
+\end{minipage}
+%
 will force any value speculatively obtained to be reconsidered to an extent
 dependent on the type of barrier used.  If there was no change made to the
 speculated memory location, then the speculated value will just be used,
-- 
2.7.4


