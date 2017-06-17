Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=45irFzLohx4+5N44rXj61G2WttKHPy3TtnrfsyLb08E=;
 b=IkGqf4z2mg/t+xLxjOyuGWnBkgglLFci7T+qm7h9X/OwpdgNO+q1qvG+sJhN8LvpPZ
 JpCwwxHz2MRi2wfjhDIQ42pIKhalyu93g2S6bGLljF7eCSB/lsqNZugSfoYQA7qYp2Fd
 1BGWp+c1x9pCuUDgpYOfyqTPO8GkuNMYdoJdYd4qd/MmXpVOWFMOpjKmj/BVjGqRYcF5
 J9TpUlGGZ3FlbOnbyo8qzDbZmvIfr/Qs39VuGQSqLVQdKDSJiXdkyuJLXxRhW+dYB2+5
 ZHRXVjQeMBmJ4ooybX2oZ6eCQ+BYpvHX1nmh9QuevEApjh/TBsf4dlUmLFiHnhYJQ+pa
 czLg==
Subject: [PATCH 1/8] hyphen2endash: Add patterns for QC section
References: <8919b898-9e43-8f72-39ce-5d31dc84f45d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <e9e6626e-cf26-3e19-819a-f9bf5a65c6dc@gmail.com>
Date: Sat, 17 Jun 2017 12:56:11 +0900
MIME-Version: 1.0
In-Reply-To: <8919b898-9e43-8f72-39ce-5d31dc84f45d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 6a9f25ad29b9e094ec38495f63d831aa9fca596f Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 1 Jun 2017 21:08:01 +0900
Subject: [PATCH 1/8] hyphen2endash: Add patterns for QC section

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/hyphen2endash.sh | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/utilities/hyphen2endash.sh b/utilities/hyphen2endash.sh
index 4736c31..29e3896 100644
--- a/utilities/hyphen2endash.sh
+++ b/utilities/hyphen2endash.sh
@@ -19,6 +19,10 @@
 # Figures~\ref{foo}-\ref{bar} -> Figures~\ref{foo}--\ref{bar}
 # \co{xxx}-\{yyy} -> \co{xxx}--\co{yyy}
 # yyyy-\commityear -> yyyy--\commityear (in Legal statement)
+# nn-mm~nanosecond -> nn--mm~nanosecond
+# nn-mm~microsecond -> nn--mm~microsecond
+# nn-mm~millisecond -> nn--mm~millisecond
+# nn-mm~\emp -> nn--mm~\emp
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License as published by
@@ -46,6 +50,10 @@ cat $1 |
 	    -e 's/and[ ~]\([0-9]\+\)-\([0-9]\+\)/and~\1--\2/g' \
 	    -e 's/\(\\co{[^}]*}\)-\(\\co{[^}]*}\)/\1--\2/g' \
 	    -e 's/\([0-9]\)-\(\\commityear\)/\1--\2/g' \
+	    -e 's/\([0-9]\+\)-\([0-9]\+\)~nanosecond/\1--\2~nanosecond/g' \
+	    -e 's/\([0-9]\+\)-\([0-9]\+\)~microsecond/\1--\2~microsecond/g' \
+	    -e 's/\([0-9]\+\)-\([0-9]\+\)~millisecond/\1--\2~millisecond/g' \
+	    -e 's/\([0-9]\+\)-\([0-9]\+\)~\\emp/\1--\2~\\emp/g' \
 	    -e 's/\/\* Lines~\([0-9]\+\)--\([0-9]\+\) \*\//\/\* Lines \1-\2 \*\//g'

 # Last pattern is to preserve "Lines n-m" in comments within code snippet
-- 
2.7.4


