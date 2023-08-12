Return-Path: <SRS0=2H1n=D5=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691830221; x=1692435021;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w5WINy6glqMzKxFnG6C4WGyCpZjx20ogYRbE77GP7qc=;
        b=F8NsTTKeURLh5T/jLLjnD24VcJdxkv6TRwix8Y9xe7MPHoQ4TE8K7k7aGJnUms3lJm
         w+LGhHREU5Egz4W59/lHRMb+VxIgF1bdX7zGixjAHq7n71EXzTj4VR69FcqH62FNN8T1
         F1fnOc+kdO7NEGO/eIs3dzrngXG4ni3JuoMyv8vv/WPSrvxHDYy6oVH0UMwizEYijFF/
         5f9jz68uxCUKmRn1l/8QYwwhvaRIGiStOQELSMRUMlu0e+0Lph6yuqvylMKnfrqyzEHs
         FVVHssPtK5VXH3pj40sBMhCUc/xb084zRvxvrwHMjlgHle36heKXWsYTnADE/WpyDi/2
         yH2g==
Message-ID: <02da2982-e706-02a7-bb96-92bcd510c8b3@gmail.com>
Date: Sat, 12 Aug 2023 17:50:16 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 4/4] bib/hw: Declare URL of MichaelLyons05a as
 broken
Content-Language: en-US
References: <bfc20978-26e4-8fa1-28a7-894dc8728615@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <bfc20978-26e4-8fa1-28a7-894dc8728615@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Looks like there is no way to see the article of 2005.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
web.archive.org doesn't help here...

--
 bib/hw.bib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bib/hw.bib b/bib/hw.bib
index 905e3f7d9ebe..b0885e746d2f 100644
--- a/bib/hw.bib
+++ b/bib/hw.bib
@@ -380,7 +380,7 @@ System Programming",
  month="November",
  year="2005",
  day="16",
- note="\url{http://www.ibm.com/developerworks/systems/articles/powerpc.html}",
+ note="\nolinkurl{http://www.ibm.com/developerworks/systems/articles/powerpc.html} [broken, August 2023]",
 }
 
 @unpublished{IBMzSeries04a,
-- 
2.25.1


