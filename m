Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=uCqqYfdOwbS0jEO1Ihf9G5D6/0aw1KngwEwQdTh7SLY=;
 b=YQNeOzld0vcCDhaRRhcTwSdc8ywVVJ6Ba5npGx2R2i/L5zzbX0BxcEf0G6dLFuMRy3
 Y+heK4TrQlKbt6MDHWAWqeZmoz0OvAzRIGMdimJT5/w316nzB0oXahqToL7cltQz8KLs
 H6hcrwVMzKvNsQ7AxA9LuZy8zQgvzE8X7QJ94xv8voDWKckfKBW9OfeHvrAnIPqcPrQd
 QRvm7czHOLBTlyWS8TVnQBWswexEQbPqmPDxpCs9VcgTzoqb0zUEswVp6lvVTP8gP+5N
 HHd3dABzNga/554LU3s958vt2M7u58dsAnhiwG7KwFglzzQgy4oyrxh2wYTKmlN7wnFb
 oavQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] advsync: Another fix to use latex reference feature
 consistently
Message-ID: <57087D07.6030207@gmail.com>
Date: Sat, 9 Apr 2016 12:54:47 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: sj38.park@gmail.com, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hello,

This is the first time I submit a patch.
I'm not sure the format below is acceptable or not, but just trying.
If there is any issue, please advise me.

Regards,

Akira Yokosawa <akiyks@gmail.com>

-- >8 --
Subject: [PATCH] advsync: Another fix to use latex reference feature consistently

In commit 91bde6aa87c2884f19d2a83534236cdbb319d625, SeongJae Park
has made changes to enforce latex reference feature to the references
in the `Advanced Synchronization` chapter. However one of section
name direct citations is left unchanged in the commit.
This commit fixes the remaining one.

Signed-off-by: Akira Yokosawa <akiysw@gmail.com>
---
 advsync/memorybarriers.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 12771ec..e527def 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -1508,7 +1508,7 @@ Read memory barriers imply data dependency barriers, and so can substitute
 for them.

 $\dagger$ Note that read barriers should normally be paired with write barriers;
-see the ``SMP barrier pairing'' subsection.
+see Secton~\ref{sec:advsync:SMP Barrier Pairing}.

 \paragraph{General Memory Barriers}

-- 
1.9.1

