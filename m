Return-Path: <SRS0=6f8h=AU=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682810175; x=1685402175;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4t9igYsaCo92RyhwPYAovAf0pm8yShzeihW1qLyXkdA=;
        b=MX77N8Fz8gjjiaVHzBklebU+WH804mQIGfsNNRczC8kAERhTi07kPevC8dZxYSbGfT
         44lBSVgfIuUxEEu+Wsmlm/fg3+C1f3N36lghh7zodaVlDfma45s0XyCy5Wmvk7WCeUcA
         zq+n/80stAar5ZeKpHfeWF16+KiuwT3f9HssO/3ho+SHdlS/SYqbSqtdfxRLgWIZ1cg/
         vbHixNBYwEGbg2HUUGIqW3UAfwFsMEwyhQBthM6ABaNNez6IhRBxOyrZieEFISNB9amg
         YyHOrsTi3IihepKVTdt4Y/YxeIoW6vv70sWOmW3nwKodbMHyfIKYXlkioKNU+Z8/zEdc
         CA+g==
Message-ID: <3780763e-e841-1d14-d9ac-546b56e7f34a@gmail.com>
Date: Sun, 30 Apr 2023 08:16:11 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 5/7] count: Adjust scaling factor of Listing 5.18
Content-Language: en-US
References: <2403fec1-1f05-c8ee-92cd-0350f9714f18@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <2403fec1-1f05-c8ee-92cd-0350f9714f18@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Alan Huang <mmpgouride@gmail.com>, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Recent code updates reduce the line count of this snippet.
Use a scaling factor closer to 1.0 for E-Book size builds.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
Cc: Alan Huang <mmpgouride@gmail.com>
---
 count/count.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/count/count.tex b/count/count.tex
index 3b8b1c113486..48e3f03d4ce2 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -2434,7 +2434,7 @@ the fastpath happens before this change of \co{theft} to READY\@.
 \end{fcvref}
 
 \begin{listing}
-\ebresizeverb{.81}{\input{CodeSamples/count/count_lim_sig@migration.fcv}}
+\ebresizeverb{.839}{\input{CodeSamples/count/count_lim_sig@migration.fcv}}
 \caption{Signal-Theft Limit Counter Value-Migration Functions}
 \label{lst:count:Signal-Theft Limit Counter Value-Migration Functions}
 \end{listing}
-- 
2.25.1


