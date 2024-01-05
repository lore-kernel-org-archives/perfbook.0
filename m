Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE082421D
	for <perfbook@vger.kernel.org>; Fri,  5 Jan 2024 09:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IH+0R5nd"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-595559ab71eso712285eaf.3
        for <perfbook@vger.kernel.org>; Fri, 05 Jan 2024 01:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704448402; x=1705053202; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4+3gEhn14XxuKwnESiQoWBNyU8LRZtGPJ7kSSGvXEJU=;
        b=IH+0R5ndMm7LQ66XejYbeA3y2/N9Hnfbfc2gZGLToNfn77zysb+OvKIpXLm7fmjv5k
         KLz4v5DHJpHyZ/M7m03TlprkMblo4N31kMNwG6I5Oss8jksGipb3/20bGMnzDYIayy4L
         oFShf27APTypf1yf5iSFyB3MjJ2/cr4ZEg+aM9dtKVRWV4MCwLNzdrfzCS1A++3yDgay
         ngabxd0a4EZBCJYrnwDpBFr9sr/ol2yrArsNRfpqJq9L/vxepUI9hrrchtQ/kDyeCBx0
         ac53eDvF/8XwmhAA4Bu7oXiQcrqUpzlIQrw4XnlWLdv87+JHWuM8LRlwgTTpwqK6wHAj
         OefA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704448402; x=1705053202;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4+3gEhn14XxuKwnESiQoWBNyU8LRZtGPJ7kSSGvXEJU=;
        b=AfCXesQ3qv0jKnLfY39Hs3mBNXNBhdLojr+n2zLwDtZEJTcG6V02BJ86YogEZx/kpo
         rNfg57hYt5aFv1UtWUJkyrJtCZY4XKxWFODPP/G6W7duL/PAoOQ+u2vCQ97lzPILvORv
         RNHk6lfsGEq4ddXWlUfRPJ1SAi4XBdsC44p1itSOZtHSH9TvN2ZgcCYNjrm/eyRMcvjo
         1gP2eDqSPCvafGVR1Z+5ybjg0OIhDOTz1VVSN+E0FNzv9diTum85b+cdFT7+WA3a/xx0
         RmnPOmla0lUBryVV3NlwQWrn7/Zzu98EVApXcnFHIH20ojTFIhxLbiq/S42HSFLj6qO5
         g5GA==
X-Gm-Message-State: AOJu0YxxuNWLfUZElctgdfqM5wu4VZqitqoqbSP/gmaH3W2KfC3w7elt
	ksPgTyh4OPUP1MpHrFsAt5g=
X-Google-Smtp-Source: AGHT+IE9Mtk6hIZ2K9JNgP/1A57YdY+iVdJdItNUWQIJDMmK0bvfcKwFk+o/xgDMj0Gm/riCw86pbA==
X-Received: by 2002:a05:6358:70f:b0:16b:9480:41c8 with SMTP id e15-20020a056358070f00b0016b948041c8mr2171299rwj.1.1704448401618;
        Fri, 05 Jan 2024 01:53:21 -0800 (PST)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id z6-20020aa785c6000000b006da24e7c16dsm1029605pfn.186.2024.01.05.01.53.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jan 2024 01:53:21 -0800 (PST)
Message-ID: <fcb36d22-36aa-45ae-af9c-c48b2fa1daee@gmail.com>
Date: Fri, 5 Jan 2024 18:53:21 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 4/8] Makefile: Use rsvg-convert anyway if no
 inkscape is found
Content-Language: en-US
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <8d0ffcdc-59f9-49ef-b8e1-313e71cac913@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <8d0ffcdc-59f9-49ef-b8e1-313e71cac913@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Even if rsvg-convert is too young and its SVG --> PDF conversion
sometimes results in poor-looking figures, using it is much better
than giving up the conversion at all.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index 3844c37b..46c2bfb4 100644
--- a/Makefile
+++ b/Makefile
@@ -126,6 +126,9 @@ ifdef RSVG_CONVERT
   ifeq ($(RSVG_CONVERT_ACCEPTABLE),1)
     RSVG_CONVERT_GOOD := 1
   endif
+  ifndef INKSCAPE
+    RSVG_CONVERT_GOOD := 1
+  endif
   RSVG_CONVERT_PDFFMT := $(shell echo $(RSVG_CONVERT_VER_MINOR) $(RSVG_CONVERT_PDFFMT_VER) | awk '{if ($$1 >= $$2) print 1;}')
   ifeq ($(RSVG_CONVERT_GOOD),1)
     SVG_PDF_CONVERTER = (rsvg-convert v$(RSVG_CONVERT_VER))
-- 
2.34.1


