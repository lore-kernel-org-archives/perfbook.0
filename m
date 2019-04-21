Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IsSWHdIA1IrLZhXLm1GslOZY1+HSDtzJ+GTIAswpi/U=;
        b=D5BEQlHyEENb3D4Hb/e7iA3NuODKfM5lBgELZ70y8K1lE7YIwwjeB1FjzJqXa0Ofgk
         q5Z5wG33gBNO73aN/w7hQRNs8SuPIFbmMHIBEUtbJmr296vRBx0k5SI1cjFWFc+F/dID
         J6iPWJSpejX8yxwl1zVxAYRj7OH6PDf06pQ/GoMgc1QteUTAv4g6FEqQkrqc2SKx0JGb
         D5xJhCvk7vKfsiFavDtLgm7Qu7Kgkt7GljuB2EJJcDHjnhByOxfXSi3y36l1mnmO7C3e
         fN8sYz0pKhJ1ZLZo7fHM0pfvZy6gGMO94cz0fcn2NKO1k+ICN1wSKARh+Ann/hCpl4CV
         YnXg==
Subject: [Not a patch] Possible incomplete sentence/clause in defer/hazptr
References: <6cf9cea0-09ad-7a66-34b1-5ee5f52258bc@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <d4dbe4e8-0f2f-49ff-8f40-09be23795e00@gmail.com>
Date: Mon, 22 Apr 2019 00:25:00 +0900
MIME-Version: 1.0
In-Reply-To: <6cf9cea0-09ad-7a66-34b1-5ee5f52258bc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

The sentence shown below as a diff looks incomplete to me.
What is your intention here?

        Thanks, Akira
--
diff --git a/defer/hazptr.tex b/defer/hazptr.tex
index 4b61d34d..7297e90e 100644
--- a/defer/hazptr.tex
+++ b/defer/hazptr.tex
@@ -240,6 +240,7 @@ element~C, which means that Thread~0's subsequent accesses might have
 resulted in arbitrarily horrible memory corruption, especially if the
 memory for element~C had since been re-allocated for some other purpose.
 Therefore, statically allocated global variables), hazard-pointer
+% @@@ looks incomplete @@@
 readers must typically restart the full traversal in the face of a
 concurrent deletion.

