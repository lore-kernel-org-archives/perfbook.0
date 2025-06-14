Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BB62E11D3
	for <perfbook@vger.kernel.org>; Sat, 14 Jun 2025 02:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749868402; cv=none; b=PMh4VNOaA439wIngsfRkNKNNwAleLwp7VxpRUIzxNH+wIYQqHxZz0k+A9WPuvDlX/tJT00r1z5b7ZCSgQuTLZLAiVsdFwqlnDeCjCBTFmngQxD12e8l/EVWoRiswBQP6sRXOa1rcsFHjxJ/0A/cxe44NhUoEYZMuPNmjKFQKxiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749868402; c=relaxed/simple;
	bh=dn1xOd83BSfZrf81TROS+fjK4/nFq6yBCw7ZzIl1A34=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=TlHodlbEODQ+0Q7UWfUUGJSarzYya7XFibkbV3yuG7W6vz8tsIGcfvR1Ywx1SbrF120gUCR2dHjipIRKfoe/5XYJp1V5vzkuq+BUPb2qWfSQQ/snYctoqXuwNnBSmfJ4IH5LTrEVCgckOmThwNh529xM5WOBNoy041AmD6ocM7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UVvNiw6O; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UVvNiw6O"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3122a63201bso2697514a91.0
        for <perfbook@vger.kernel.org>; Fri, 13 Jun 2025 19:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749868400; x=1750473200; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lA0u80l/5+VscYdOgKW4WXn0JWuQty1qyPK9P6Fpu3w=;
        b=UVvNiw6OE59Vtw1lwux31eSiVoE50bV97HIs72mSwPOlnLiMu1shG058I7rqsNAHGa
         hJt7AT7dYkcXQ+KLHB5ywY+3lSEwKInJgLVi6jrqHtdqXouovFa5E31tlQ7ZZZouXc08
         3Xk8j3LgFNyRC8ssj+ahVeOj5b3crnvsXgn18uxYa/CdND9FzN90MbToqzr94HRg0OWI
         VM12vWdHDpFX/Rc7KPfdcy2nfyRqpVTeOHnZbqzOka0YN0rgBTpq/mhqG3OFx/U3AD0J
         lpUUduniWh9bkYXELfs3fOYcB5gRpIeSm/VTbvimTzX33Zp5nOP9gErGVqrp1as0AY7D
         0EHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749868400; x=1750473200;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lA0u80l/5+VscYdOgKW4WXn0JWuQty1qyPK9P6Fpu3w=;
        b=CNVi95ZIvihbkxpGkZVjyejiMEvJFYqv1eUz8Ao6BrZ9wm2V8wj23pf7pb8FJSn7Fj
         nfO/+NkeW28Y7UisWdcCor1StvfGiZGW2AH0XzZ8BmfYlFB8CRrKve5xjmNAbeORjgEW
         wYaUe8tt2eewaTt6T2sjEM2zuETQLkfPkVoZaC1IrNn3lSLGusLxFqzTsQK9pHXi43Uh
         Eg5Ur7qWy54PVOmSzXfnHfnSmogj0rlvc2yf3pcazGHMvx8esjsG4L6J6J+MAmJ2sUjd
         qH55wxATNaEd76pkDOnYSCwoc56w5BAdli6PqZlWcBoGJe+2tmfRRbyVMWE/yBevDUo6
         s09g==
X-Gm-Message-State: AOJu0YwY+Wh6E8dfr1J3h0NX/4NJYtJG/6HYgLQGtzG5Ive3qLJFjEsM
	vJZ6/S+46M3LmYPwNUDRjcgqumoO8tf1IzLnV+G43gvSfUQta7kykPUX
X-Gm-Gg: ASbGnctOHo/DB6WE5HfJ8WxfnOQwjPVnNE4CCP2hYz6zpHWsw9+fE2AWOaFkYEwMzsl
	QL/tc7D4G8z8NKgKvpiqPlZceB/WfEXD+Y7J6OT32DjKHRieGn25sVX4DDkxvxalGjQJ+DjkjO+
	V7Na6RUgWDMHnRAGd4GqfXFU4ExBvtIxPB9AZ4ORvpvAaIOsJNDfmm7cUr1N3TKcul0PqBGkxBR
	WPo1JKJj0XbdTlzhig5dz13xmiwHl8dsisekLuoqv/E7KBTxeJy7gswzVJEz043zaeDQORlL/Xy
	1pDCZGhhwu3jXeE7Ia4yUO2o0EfhrZ1JUCCqxOVrHHqRSQ5O7ZFjWJ6B5H9kkz/G87NXSMRkHyM
	mF8Ia3MmoOTxzicNfTOqzdf/RIQqoszLvzkXNphkzfKo=
X-Google-Smtp-Source: AGHT+IGXEHTOpf67ZrkJrjSgFwO87LTErLWGW/gzE76RvpjfFL6aLhUGEkzVtfhHho2uywdYCrwb4g==
X-Received: by 2002:a17:90a:e7c6:b0:312:b4a:6342 with SMTP id 98e67ed59e1d1-313f1dd5483mr2985600a91.33.1749868399876;
        Fri, 13 Jun 2025 19:33:19 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1c61f60sm4633604a91.42.2025.06.13.19.33.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 19:33:19 -0700 (PDT)
Message-ID: <8820751b-9b42-4408-b388-14f42030b891@gmail.com>
Date: Sat, 14 Jun 2025 11:33:16 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Leonardo Bras <lsoaresp@redhat.com>, "Paul E. McKenney"
 <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] gitlab-ci: Append /usr/bin/*_perl to PATH
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Subject: [PATCH -perfbook] gitlab-ci: Append /usr/bin/*_perl to PATH

Under archlinux-based container runs, non-login shells need to source
/etc/profile to have package-specific commands such as encguess (under
/usr/bin/core_perl) appended in its PATH.

Add the command so that the change in commit 00361e8bb1e5 ("Convert
*.log files into UTF-8 encoding") to work in gitlab-ci builds.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
Cc: Leonardo Bras <lsoaresp@redhat.com>
---
Hi Leo,

I think this should work, but I have not tested under gitlab-ci.
Can you apply this and see if the message from grep:

    ...
    pdflatex 1 for perfbook.pdf
    grep: perfbook.log: binary file matches     <===
    ...

disappears in the build log?

        Thanks, Akira
--
 utilities/gitlab-ci.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utilities/gitlab-ci.yml b/utilities/gitlab-ci.yml
index 60e70a26..f03e39a9 100644
--- a/utilities/gitlab-ci.yml
+++ b/utilities/gitlab-ci.yml
@@ -23,6 +23,7 @@ generate_pdfs:
         - mkdir -p ~/.local/share/fonts && cp fonts/steel-city-comic.regular.ttf ~/.local/share/fonts/ && fc-cache
 
     script:
+        - source /etc/profile
         - make perfbook.pdf perfbook-1c.pdf perfbook-eb.pdf
 
     artifacts:

base-commit: 00361e8bb1e59a0cf7a2a83028fab323f60c2207
-- 
2.43.0

