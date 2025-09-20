Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32E05CDF1
	for <perfbook@vger.kernel.org>; Sat, 20 Sep 2025 09:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758360230; cv=none; b=fqgRn6nPvSUY0C2QUsl2RSEsE8T0EaN39bLlFnTYez8LQJ0PgTBkgwBqvQHxJet1MAss5PVULW8rJbtr+d8cxlzrVuSeElLI9ExpVGHz3uYth7IsCMpUrUsXUCKH05XGoKnrx48Pz0KR+qVmuQiKsP43KvIvkerWrhQD7CZE104=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758360230; c=relaxed/simple;
	bh=BxaFllsOTaIi25KVQTnzrksXvcT/46wdvET1Jb36fJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SemRkTpI6XE+6l9FuoJ1ZpbFwEQdvcKWw2p7S2M1SlLduMKfzMdsKUqKuQz66g+GS4wcreBqOsUnvrgXKMCw2yq4Y2TOOoiFA27mk7DmaQulCmbFGnKlutCdo4jHWJabf+QtBhpxbhMcS+CbgIQBPIO82Rsx0EqtNBqMjIowN6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RLCvzmTa; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RLCvzmTa"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3322e6360bbso88845a91.0
        for <perfbook@vger.kernel.org>; Sat, 20 Sep 2025 02:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758360228; x=1758965028; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QbQSAOzA2B+l0WF2jjBuJMbJQh6GmZViMm6zHB9j8Zw=;
        b=RLCvzmTaqT/xSrcI90i+GQwHS8tUf2dtUKMs5wWn00fHVsh4c3lThQzVt+JFX5x6U7
         DKbhpErrwkg0QTmzuCVWZkST3z3WwadP3GmKs4mdgYKQ6fdZXFY7c+/sQg6AlUxAzEJV
         w37OForeaTH03cZ5aIfARYvscAXh7aSHJTFdWq+KKnQoik9YPF8060xsrbXnBf8FimB6
         kdxj4/cNBCwwnRdRu7e+hUssjB048c+bmN8jjfhnioXjmbdw/ihMypyMMntyFKaALT3y
         0aU8AevvRWO38rOTW0w50yVrosvNrVRFUpC8qPBfhzH5NtrxxdYv89h9vGU/0I32eqJf
         BWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758360228; x=1758965028;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QbQSAOzA2B+l0WF2jjBuJMbJQh6GmZViMm6zHB9j8Zw=;
        b=sClLr1ArREiGrQohTqusa3L1sR6mrG2YN177UAw8mPW7/1oQXnxVRGpkUeJcBjPTXj
         8s1BJPlh0KywjbG2eTbbCmD0XyLGxarCpjwmRGwpg/T0BbugT+Qo1Gz3bLphI7re+Bws
         LFrHae1K9OxLZFJGx2Oz5nuXC0dnFcD/gL0yiUi21dKVlC7ueEYJAHkU3RelQ18aA6et
         Il+vHcvCNyuPRUjE6tGEsUiW+oFY6+QuZXhRQQYdZbIzvrtAQWbgMwjnjDKNp6a+EFUa
         MxCX4iv9m6iA5PsKRMN4/A9eB0TtUrk/5VnDN2baPdW6Fli64hYtVGBpNcApLm5iGq+z
         cw+A==
X-Gm-Message-State: AOJu0YyK3LesC2ECPGvw2MzGd2PFFBKpKfAwKlFxe1ypWTo8AJEkaF7L
	bpz1x9RwQBE8vTN/qHeGGsDFqctioz/jN8k4TQQe4mCj0cRiXv/Ul3St+XQ2kQ==
X-Gm-Gg: ASbGncs/61UX4uKctrd72ncEiKkmYvkjw3PWsIp+LTkrIxq/iuHlmmx/hL+bWJhEuvZ
	G7Zv/gn6Uc0VZwhxMFvsQ2U36zybqmhjtDqy5tD3EFOrXTgb7S3jkj1DieTmw+Ri73Kn/QDJFr3
	/tN/x5yQTPLKZfd0rSxJLNaxMz1itfAhlcx20i6PZ6/7Te2SjyGkdjLfU4QlFg2O8OkCcffvOAm
	M8VfIN+STpq6SqiHRUxl+T2SQ4OiMeNV75FGxm/LvIhHPZKcNnM/k+rHDBz2i1wwBLuN10HOaTU
	gj77Iw53WnEfwK7xuumikyyAnKZlxx+owyUBQe3hSUFFmZuBMAQHjpQicw88ncs6QT/2UD4js8G
	cvqiN6A/nuC83L1FyZ2IqhgoRUO6rOAeTGZ31bi7SrtzbAiJnE+SRbk+BjWFjC2zM0ge0
X-Google-Smtp-Source: AGHT+IGZiAWksj3/uA8szqOc9Cx6zOnxOkO8eI1sIaLFjv8o+vQD3hGAUtF+m6508gi9PKb7Li6uGw==
X-Received: by 2002:a17:90b:33c8:b0:330:6c04:a72b with SMTP id 98e67ed59e1d1-33097fdd77dmr7365252a91.3.1758360228005;
        Sat, 20 Sep 2025 02:23:48 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-330607eaee3sm7780847a91.22.2025.09.20.02.23.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Sep 2025 02:23:47 -0700 (PDT)
Message-ID: <9b3af6e2-6cff-4d41-9552-e18674d71071@gmail.com>
Date: Sat, 20 Sep 2025 18:23:45 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Subject: [PATCH -perfbook 2/2] utilities/punctcheck.sh: Check use of
 "\%"
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <5779e065-b5b0-4dc3-965f-dbabe56c0d2f@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <5779e065-b5b0-4dc3-965f-dbabe56c0d2f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Teach utilities/punctcheck.sh of the pattern for the percent sign by
adding utilities/percentcheck.pl and letting it invoked along with
utilities/punctcheck.pl.

It could be added in punctcheck.pl, but doing so would further complicate
the script.  Therefore, a dedicated script.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/percentcheck.pl | 39 +++++++++++++++++++++++++++++++++++++++
 utilities/punctcheck.sh   |  1 +
 2 files changed, 40 insertions(+)
 create mode 100755 utilities/percentcheck.pl

diff --git a/utilities/percentcheck.pl b/utilities/percentcheck.pl
new file mode 100755
index 00000000..0fe83276
--- /dev/null
+++ b/utilities/percentcheck.pl
@@ -0,0 +1,39 @@
+#!/usr/bin/env perl
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# Check LaTeX source of percent sign
+#
+# Copyright (C) Akira Yokosawa, 2025
+#
+# Authors: Akira Yokosawa <akiyks@gmail.com>
+
+use strict;
+use warnings;
+
+my $line;
+my $line_num = 0;
+my $next_line;
+
+sub check_percent {
+    my $line_raw = $line;
+    if ($line =~ /[0-9]+(\\,)?\\%/) {
+	print $ARGV[0], ':', $line_num, ': ', $line_raw;
+	print "Hint: Use \\pct for percent sign as unit, say \\pct\\ if no punct follows.\n";
+    }
+    if ($line =~ /[0-9]+\\pct[ \s]/) {
+	print $ARGV[0], ':', $line_num, ': ', $line_raw;
+	print "Hint: Say \\pct\\ in mid-sentence.\n";
+    }
+}
+
+open(my $fh, '<:encoding(UTF-8)', $ARGV[0])
+    or die "Could not open file '$ARGV[0]' $!";
+
+$line = <$fh>;
+$line_num = 1;
+while($next_line = <$fh>) {
+    check_percent();
+    $line = $next_line;
+    $line_num++ ;
+}
+check_percent();
diff --git a/utilities/punctcheck.sh b/utilities/punctcheck.sh
index d0ade754..cf264243 100755
--- a/utilities/punctcheck.sh
+++ b/utilities/punctcheck.sh
@@ -21,4 +21,5 @@ done
 for g in $tex_sources
 do
 	utilities/punctcheck.pl $g
+	utilities/percentcheck.pl $g
 done
-- 
2.43.0


