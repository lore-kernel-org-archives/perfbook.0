Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NsDnpjNT"
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ED5A124
	for <perfbook@vger.kernel.org>; Sat,  2 Dec 2023 09:26:27 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6ce403523e5so49969b3a.3
        for <perfbook@vger.kernel.org>; Sat, 02 Dec 2023 09:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701537986; x=1702142786; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=clMEIfqBirDiD6HL+cJgx0TmxmGvCI9aWSiP4DDExiE=;
        b=NsDnpjNTfasC45Nta+tjVSikE+JhL7f0oj+4IWyouVRz+jzavXqpfWNOCb2UMuHkb2
         oZc+kabwGTD75u8JVGFfzBkB3AhwsW70JzGLxjFu36ZdQvrFaWY2opdqDJHJ8AsYcohW
         cIdeuY1vPjDubnbBrM+ncobImFo48w0otC+EjvV89MrJ4+Uz9dRUaf7EjdHTOKafw/NN
         sj1PFS10qKwpuKEyfa2x3Lzj2AmIxr2mSD7O9WGO2E0u8pYQSSTY9Lv7g6wGta9zJQzZ
         0hdo+nCUMj5r+eeHrKYc/EUfx0nnhMg5Wu90fivjiQC8U3pLUIYH6yzQwGtLr06HkaDz
         x1hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701537986; x=1702142786;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=clMEIfqBirDiD6HL+cJgx0TmxmGvCI9aWSiP4DDExiE=;
        b=TEm4BWm9MvTGGw9gV42HkpMrMm1+ZMIYxjOL/x+g4CkiaX5M+JbRYtSaTgBXNnRcl5
         x1HsG8Ool7S59WUjZQ5dTAKjh/855DtAtrwTheSsWMEIkaAswph4zoUbmTlGHDDyyh/O
         pB+2G6Yua9W+WiRpSqH3XvLNe2upr9AYmh6y5zIkqR2d4TAFCw8b2VQhI6EJ86QM+qPU
         sZ1UJQY2Fw6CbngmQLrBxIUBwMCJawIdHtRUnK5y/QPCCHwCyrzCBdjPT1TwR40H3UnN
         tvwti0Lm+AKvGZQLR8gZp+8+RB5XS+twbErPxx0shjYqncECLoQsr/+rewnPWao++gMN
         1viw==
X-Gm-Message-State: AOJu0YyvihmKIgz1LGaSPqzcdS+5ithTn/pCFAEwrqYgxqtcWC1ApYPf
	L5D84eC99nElwwk92bym0tI60QxiSuWclQ==
X-Google-Smtp-Source: AGHT+IFroNWgcRRq/W6+qKtJ4fq55G4wQOn0JKzXrXSEShuafuOF6rasaURIXzODSj8teiifeWmhgg==
X-Received: by 2002:a05:6a20:3d11:b0:18c:4800:b0ac with SMTP id y17-20020a056a203d1100b0018c4800b0acmr481144pzi.23.1701537986609;
        Sat, 02 Dec 2023 09:26:26 -0800 (PST)
Received: from localhost.localdomain ([216.243.7.87])
        by smtp.gmail.com with ESMTPSA id x12-20020a170902ea8c00b001c736b0037fsm3600714plb.231.2023.12.02.09.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 09:26:25 -0800 (PST)
From: SeongJae Park <sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org,
	SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 6/7] future/formalregress: Use \co{} for spin
Date: Sat,  2 Dec 2023 09:26:13 -0800
Message-Id: <20231202172614.20239-7-sj38.park@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231202172614.20239-1-sj38.park@gmail.com>
References: <20231202172614.20239-1-sj38.park@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>

formalregress.tex is using \co{} for spin in most cases.  Use it always
for better consistency.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 future/formalregress.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/future/formalregress.tex b/future/formalregress.tex
index a50df4ad..b1a39b29 100644
--- a/future/formalregress.tex
+++ b/future/formalregress.tex
@@ -155,7 +155,7 @@ testing, which is in fact the topic of this section.
 It is critically important that formal-verification tools correctly
 model their environment.
 One all-too-common omission is the memory model, where a great
-many formal-verification tools, including Promela/spin, are
+many formal-verification tools, including Promela/\co{spin}, are
 restricted to \IXh{sequential}{consistency}.
 The QRCU experience related in
 \cref{sec:formal:Is QRCU Really Correct?}
@@ -359,7 +359,7 @@ What is needed is a tool that gives at least \emph{some} information
 as to where the bug is located and the nature of that bug.
 
 The \co{cbmc} output includes a traceback mapping back to the source
-code, similar to Promela/spin's, as does Nidhugg.
+code, similar to Promela/\co{spin}'s, as does Nidhugg.
 Of course, these tracebacks can be quite long, and analyzing them
 can be quite tedious.
 However, doing so is usually quite a bit faster
-- 
2.17.1

