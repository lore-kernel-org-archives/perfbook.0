Return-Path: <SRS0=/ExH=JY=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OP/caCmVUCaXn89ENsHfn6n0YcvvNtP7CMAVov7UVvY=;
        b=iNEhzg866BctNc+Q6JogEVEFnnXk8ReM8tEHhaJ3yg0dDc79VuWVDNg0wNeK0B6hMi
         pkA1Efd5aI0h7TtvlM/eQAk7DpL6UYI+eUEGxoi1mA/JsjLlZdq0kK+Zx4W42q9oanco
         4NG64cS+19Qa7mwVmkd2dYVSiShr8mS99/mhsBdGgyqGZ764Gx/qpZ/ZYekP90QAwpWD
         wfhbBTOtHLcI8+fxYzxPFdJuf26jhRQtcGUtvwh7H/M+0ryreSs5n6nCSs47TDpRahGW
         XHYb5qlOXkzLpVi6WHdNmM7X+AnUlexcjbSUIG4Ykkf12MtLgQDOVySvKBGPukcuTDqX
         18SA==
Subject: [PATCH -perfbook v2 3/9] periodcheck: Add check of nbsp in front of
 \cite{}
References: <71cd07ce-5753-4007-8fab-3654956e5a92@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <f7a795c0-b372-fd0e-b1fa-702fc8c04def@gmail.com>
Date: Wed, 28 Apr 2021 00:24:19 +0900
MIME-Version: 1.0
In-Reply-To: <71cd07ce-5753-4007-8fab-3654956e5a92@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Also use /usr/bin/env in shebang.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/periodcheck.pl | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/utilities/periodcheck.pl b/utilities/periodcheck.pl
index 225391ff..c585b147 100755
--- a/utilities/periodcheck.pl
+++ b/utilities/periodcheck.pl
@@ -1,4 +1,4 @@
-#!/usr/bin/perl
+#!/usr/bin/env perl
 # SPDX-License-Identifier: GPL-2.0-or-later
 #
 # Check LaTeX source of mid-sentence and end-of-sentence period
@@ -53,6 +53,12 @@ sub check_line {
 		$safe = 1;
 	    }
 	}
+	if ($line =~ /^(?=[\s]*+[^%])[^%]*[^~]\\cite/) {
+	    $safe = 0;
+	    if ($line =~ /^(?=[\s]*+[^%])[^%]*~\(\\cite/) {
+		$safe = 1;
+	    }
+	}
 	unless ($safe) {
 	    print $ARGV[0], ':', $line_num, ':', $line;
 	}
-- 
2.17.1


