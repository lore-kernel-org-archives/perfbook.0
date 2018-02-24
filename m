Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=a+Me3ZODUHkKTfzC5Kd4iKrS8iRKCRO1dBq5RrcK36c=;
 b=on5lp05IAiIWZ7KUTRG+G/wUbTfv9sWwrj9O4+RN5+AIy16zeKWyr/VuFLAikfRJA0
 tQ7rGdW7P6T84yr6zBLyHBc2OgSBLXvlq9ZMsx1yUf0E9VgcmrD7cwVy+uTlm38n1owa
 qtnUi6vAooQyXEr+aGZw63RcHmWmweF2Hr1Rph+1ReMZAEv2+6jOE1ASptLiecX655D0
 wRmkPOvWlXaxO67iMEM87itckSQ5DuKZ1fsp3pWxjCm2HTEMTrquhoGRcY+bPzHQZfjK
 1pliVpluvndtuVH16goM8j5i9Pex/JgZKl5S3YDkgmmWOg1GDE/O2JROTesSLfWQEHcO
 BtPQ==
Subject: [PATCH 4/5] future/QC: Disambiguate 'QC power'
References: <1e4f8413-f968-9d37-6322-8057bfe97bb7@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <6d45e0b1-cb49-07ce-7a24-c6388bcdf827@gmail.com>
Date: Sun, 25 Feb 2018 08:52:56 +0900
MIME-Version: 1.0
In-Reply-To: <1e4f8413-f968-9d37-6322-8057bfe97bb7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 625cce030615870d912d19883ba7b755fa07cab8 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 24 Feb 2018 18:57:43 +0900
Subject: [PATCH 4/5] future/QC: Disambiguate 'QC power'

In QC section, "power" is mostly used to mean "electric power".
So, "increase QC power" can be confusing.

"QC capability" sounds a better choice here.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 future/QC.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/future/QC.tex b/future/QC.tex
index cffc6e1..74bac86 100644
--- a/future/QC.tex
+++ b/future/QC.tex
@@ -743,7 +743,7 @@ aforementioned desired error rates of $10^{-4}$ (let alone $10^{-8}$) are a
 long way off, and will likely take considerable work and time to achieve.

 In fact, as of early 2018 it is believed that adding qubits will not
-increase QC power unless error rates decrease
+increase QC capability unless error rates decrease
 sharply~\cite{IBMResearch2018QuantumVolume}.

 \subsubsection{Thermodynamics}
-- 
2.7.4


