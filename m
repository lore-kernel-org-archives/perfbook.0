Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EC9127B72
	for <perfbook@vger.kernel.org>; Wed,  8 May 2024 15:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715181380; cv=none; b=lPpIz4piBEiJJTtSnY5jg/WHtjd/yqnLM6ktP0D9p1cmLARLTt/XFoOnYRdOsjy4K6kfWAi2bN2xjIfQclc/fzK4mCi+BdCr12nXp0XK2LeGJuiNpF7EHU0DP6GtySJvhrXfMkoxtkDZQYgrFIYKaBZRJ0TfwUdiFRT1Jc3/DmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715181380; c=relaxed/simple;
	bh=P0BLMJs7ZYojJ94pK6ms6YUrEb+L5oB+wBU9C0J1hFg=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=BdkgaAnGWMXbymalUqtYDRQx2l2ZRT3/R66PX+LBcmjdIhjag69j2Qr11fn58xh51Ng308t2W0hzBr7wW6B+HnEz7GeWxv/d+3KQQnMXsh9d4nOGs4sdwACNBAsQnpvLRc3xUY8OZwkoc13oS9YjrhmhU3vvFUC1/3mZpj2BMRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gS0pLOdr; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gS0pLOdr"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1edfc57ac0cso28469445ad.3
        for <perfbook@vger.kernel.org>; Wed, 08 May 2024 08:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715181378; x=1715786178; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bR1G43IDxZtULHi8mC8oTVskUXbJ52UOex+vAmdnTNM=;
        b=gS0pLOdruKdwVIc+C8lpWOkHrpRqf99RZo8xuRI0dnYLQZfxRJDHjfrJMxI0tgjRKy
         ge+udj5DmjkK5tD4iLm6oxMitqiB+bvFrNq2CG5V5hRN9qR2SjK1ZDQXauE4svkEH4JU
         J+a3f8brEgP3zpgYXzq8VYqCcVIiHlBLvoFIcT4+K70NHuC58HyGtJVGI9DUUYeQ6pKv
         XUTfz5JZLjvLbJFQRmgUHsMpQCr/flpeIhnGFI9hFL8+6S+muXzcbX4cABm/cWuN8szn
         cqbLztNDiYu0jxNQ63lB+1QZ02xcsscrl3ybEHG2i7Q8jvf4PrPPyCQ3X+2/YCxCzTt2
         WwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715181378; x=1715786178;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bR1G43IDxZtULHi8mC8oTVskUXbJ52UOex+vAmdnTNM=;
        b=B5VZ2kUcx99lynQuF9GpTA1slM/gESXj3mXkomY229SWdC3EwR9mzdGrKJtVD114QQ
         VXVUN7eXeOXMG3XDdf8AKkL5WCWlRDxeMqybWtjhOjC/kOqThFVK5YV97USdJsoLP3ZU
         QE77ZsXIC9Fw7Kl7Crmm3CxZ66hKD4RRZNlelss9OmHhroO0sH7ytHrW7UHoPYavj/6u
         zwbJZfL5Lnm1sZaDIyShUbx2EwNvrSTYi//VxXjBTvNQwKC/cEdQDGs4URFuZEr89zZd
         fH/uzx/lgK3TybPy6mZJhOn2wUp6IdvdRhEcPwhrq4/O7uu8sNTJkeqKhswJvCcpBjfP
         fc3A==
X-Gm-Message-State: AOJu0Yxk67n595TCxoK3LmgjoRqX9CYc64TYMG70iILayPCe8flX4MvR
	ezpDAt+vW0065lzIfrGUmxU/ehDC5oFK7o56XoSEhjyMvWRuso7FAEBYFA==
X-Google-Smtp-Source: AGHT+IF2IMkrSCpNozQ8oklqN1GDAiFBF2e0aB59zaL+3jopr8a03FJ/fH5egnvMHde2Q0fyZ6RZ7Q==
X-Received: by 2002:a17:903:22c2:b0:1ea:d979:d778 with SMTP id d9443c01a7336-1eeb049b2a5mr32984195ad.5.1715181378478;
        Wed, 08 May 2024 08:16:18 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id m10-20020a1709026bca00b001ecc6bd414dsm11908432plt.145.2024.05.08.08.16.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 May 2024 08:16:18 -0700 (PDT)
Message-ID: <bc5fc6da-1f06-43b3-b065-3292652d78f8@gmail.com>
Date: Thu, 9 May 2024 00:16:13 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 1/2] locking: Mark sentence-ending period as such
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Silence warning from "make punctcheck":

    vvv Hint: sentence ending with an uppercase needs "\@." vvv
    ./locking/locking.tex:2039:traditionally used in scheduling disk I/O.

It is needed because commit 678e6cc3c0f1 ("locking: Cite Dice et al.
for hierarchical lock") have added a sentence in the paragraph.

Fixes: 678e6cc3c0f1 ("locking: Cite Dice et al. for hierarchical lock")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 locking/locking.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/locking/locking.tex b/locking/locking.tex
index e4ebce51..e0e17253 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -2036,7 +2036,7 @@ into account, preferentially granting locks locally, while also taking
 steps to avoid
 starvation~\cite{McKenney02e,radovic03hierarchical,radovic02efficient,BenJackson02,McKenney02d}.
 Many of these can be thought of as analogous to the elevator algorithms
-traditionally used in scheduling disk I/O.
+traditionally used in scheduling disk I/O\@.
 Dice et al.~discuss use of local and global locks in order to transform
 any architecture-oblivious lock into a local/global locking scheme
 that optimizes for the system's structure by providing (for example)

base-commit: 15fc91c0c6dafb32337f505069a0805a4e3c5858
-- 
2.34.1


