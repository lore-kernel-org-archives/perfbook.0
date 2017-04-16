Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MeQj+lzcun896faiLpYLpVHLDGNzZPQF2zRECf+6kHk=;
 b=bjzsVi4Vo4PidhcTM3u6CJD1iBW8Uuf2nZRiBwW2TDHDXYhMk4FWsDfYCyBlM6ndir
 8KlsNvLZt6LkOc9zW+VU/9kxMHOrTgnr66O5xDutyWldvb3bVzkywq4XuHrgUS2/hUl8
 xyz6UsEMpUQL0nk9ZDTteqlTRPuhEirHUH114oXSGfVsrtEjuiSlqB2hTDfdLDLlQTZV
 quYkOTAn/YX7zG0YnZrXK4cC8WIIvlg+7T9+hfOnYQzJwL9dUNiZb6JLuxrTqv8o3kSX
 kNGE8jXDyBKkrQ7WXPyxZQ0hRt4NApKzWahA9qNtczkJaRnGkHjll6Zj++aLgP64XQHQ
 w/Ew==
Subject: [PATCH 12/14] advsync: Add another footnote implying data dependency
 barrier
References: <be8c3cb5-9ee2-9f60-bfcd-e729389304f9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <ad1552c5-2a70-13bc-8931-52cd5b7c9a24@gmail.com>
Date: Mon, 17 Apr 2017 07:25:52 +0900
MIME-Version: 1.0
In-Reply-To: <be8c3cb5-9ee2-9f60-bfcd-e729389304f9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 9fe9a9b3ae4323986287d291e7a516d90163b742 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 16 Apr 2017 16:11:30 +0900
Subject: [PATCH 12/14] advsync: Add another footnote implying data dependency barrier

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 6cf25a9..2b36214 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -1315,7 +1315,9 @@ Q = LOAD P, D = LOAD *Q
 \end{verbatim}
 \end{minipage}

-	and always in that order.
+	and always in that order.\footnote{Again, you can not assume
+		any ordering between~\co{P} and the value loaded via
+		the pointer when they are updated by another CPU.}

 \item	Overlapping loads and stores within a particular CPU will appear to be
 	ordered within that CPU.  This means that for:
-- 
2.7.4


