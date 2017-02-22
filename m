Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=kAbNgC+jRMt+LsOvr7WisWro1rVieRnQeRpbMnxd5JI=;
 b=XnwbPHHTi6kteOnBTDvxnjV+ZTnjfVclolcwgEks0/gl+muOCHxiwCwD6AhKZnKr6+
 D5rWLbwzVzoU9YuVo9JYrnSO5OHQQU2LbCUvBt2bb89m86TZ5YerNjtHRteqbYR6tNOU
 8upTr9yGu+t7V+o+TkcslrT8W06nES5lJgFse7fudZvEOF0XmySdaqEOndnLMbGlMBhf
 6fBZGTZgfu9+Mg7+dxl1RpcbXrFb33cYU/t3gyU+ENto4fId2XkguOpTaRMPnItEQAWF
 y6rsdw+YGEYFniF++Q50QNcc/zHng1Wq/kWYTvJxAoIvSzbeylg8r2dc4SaFRl9HlAna
 5Bkg==
Subject: [PATCH 3/3] bib/syncrefs: Fix booktitle and append location
References: <f6da3408-03f7-a4d4-4910-0181e1df7172@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <1ab0cdc6-5be1-5e93-9eea-4d71cdc86fdf@gmail.com>
Date: Wed, 22 Feb 2017 23:31:29 +0900
MIME-Version: 1.0
In-Reply-To: <f6da3408-03f7-a4d4-4910-0181e1df7172@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From cd89aaf41ef91a1f7210243b883e8ef111ae08ef Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 12 Feb 2017 13:49:04 +0900
Subject: [PATCH 3/3] bib/syncrefs: Fix booktitle and append location

Appends location fields to Takada:1995:RSN:527074.828566
and Cai-DongWang1996PrioInherLock.
Also fixes booktitle of Cai-DongWang1996PrioInherLock and
other fields.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/syncrefs.bib | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/bib/syncrefs.bib b/bib/syncrefs.bib
index c702ac5..7ec6298 100644
--- a/bib/syncrefs.bib
+++ b/bib/syncrefs.bib
@@ -967,11 +967,12 @@ Georgia Institute of Technology"
 @inproceedings{Takada:1995:RSN:527074.828566
 ,author = {Takada, H. and Sakamura, K.}
 ,title = {Real-time Scalability of Nested Spin Locks}
-,booktitle = {Proceedings of the 2Nd International Workshop on Real-Time Computing Systems and Applications}
+,booktitle = {Proceedings of the 2nd International Workshop on Real-Time Computing Systems and Applications}
 ,series = {RTCSA '95}
 ,year = {1995}
+,location = {Tokyo, Japan}
 ,isbn = {0-8186-7106-8}
-,pages = {160--}
+,pages = {160--167}
 ,url = {http://dl.acm.org/citation.cfm?id=527074.828566}
 ,acmid = {828566}
 ,publisher = {IEEE Computer Society}
@@ -983,7 +984,8 @@ Georgia Institute of Technology"
 @inproceedings{Cai-DongWang1996PrioInherLock
 ,author = {Cai-Dong Wang and Hiroaki Takada and Ken Sakamura}
 ,title = {Priority Inheritance Spin Locks for Multiprocessor Real-Time Systems}
-,booktitle = {Proceedings of the 2Nd International Workshop on Real-Time Computing Systems and Applications}
+,booktitle = {Proceedings of the 2nd International Symposium on Parallel Architectures, Algorithms, and Networks}
+,location = {Beijing, China}
 ,series = {ISPAN '96}
 ,year = {1996}
 ,pages = {70--76}
-- 
2.7.4


