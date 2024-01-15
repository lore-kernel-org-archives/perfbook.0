Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EF75235
	for <perfbook@vger.kernel.org>; Mon, 15 Jan 2024 06:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nAALkVL7"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6d9bba6d773so7458616b3a.1
        for <perfbook@vger.kernel.org>; Sun, 14 Jan 2024 22:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705299650; x=1705904450; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HKK6oFYH5tXdxjuRjGfZFVTQV9YTKGQONvv1t2fdoCQ=;
        b=nAALkVL7nOIXX0BWXHBMGUeCtiGmr/c3X5fnkdsRgkx0KImw25W+DQOKePvZRgZ7C7
         tu9r7unuXt6e7SwXB/Pg5T8saclTdDrXzl/QD8cuqdwiWAXxGHYsF/h+wabfkGiq/Yf8
         aKCg/3DyT8NiwDYdolbpaExsWiN2X4TORMRpkixliGVIeR8MYFuUsLTbMWI5mYZOA+Lf
         EYV2KqqF+3l5ydR3E/8/AjMhMDImsCnEQsMPY0VYozr29jyS1K6I/iFKImDcd1lynuGf
         BqxU64d09nuVB3arSnOHhaY9Z0VlbdIZRU/+GlveC9BnufmwGUBi93DvXY2OG0X7mda/
         rg9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705299650; x=1705904450;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HKK6oFYH5tXdxjuRjGfZFVTQV9YTKGQONvv1t2fdoCQ=;
        b=tsT0Hp1kpjSNvOjIdCnYU8pCU09GNF4PTqjWjP5/ZDqNhqTzI+X6gmSQaFqkXgYk5f
         qRGlHOWN2cXuv5qrw6LWaPRVn5DufgPZaEylUwcdY7zz8VGzF4Ea1U6ct0BZbFootlTB
         UEowmfiz0hcJjNHeDR04D0CBOa3Q8VhrgpmUm82ZIU0Nu6Y8RDsgoEW+jc0OLJ33FJSx
         9vdQDAaum8IJs3nzzCW/GN8exz6A84ttBBH8AD8ZAijrIKkInHQ5JodJd5YK4WCq83v1
         bqyk5reUee43Q18fWK3/kz74u40yA6LHhP7O48EPPtKjBtCs80zzE0+zE3ix9a2pvlar
         xB6A==
X-Gm-Message-State: AOJu0YwiqgnwoYjNffXs+uRX6zpI+Or2crIgja9rPg+o2eMsDfAglIIR
	gjdAhaV/VgFh2Eeu0zNqg1K2KoU5ShzVek1N/Dc+Ha2B7/M=
X-Google-Smtp-Source: AGHT+IFnQD1voha+NqnTYJoAU12oD1ElfqKHD3ywfgv1F33Z/9/dCkI+ayC9ffcO6EN+HYvDeIasNbWLcPWNxdrOQMA=
X-Received: by 2002:a05:6a20:bf18:b0:199:331f:6061 with SMTP id
 gc24-20020a056a20bf1800b00199331f6061mr4651663pzb.20.1705299650003; Sun, 14
 Jan 2024 22:20:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Mon, 15 Jan 2024 14:20:38 +0800
Message-ID: <CAABZP2z38Yg+J6veQQxO12rUMroPQM7ZOz=Bg6GTYn5G9r85Qw@mail.gmail.com>
Subject: There is a line missing in the diagram Figure 10.18 and Figure E.7
To: perfbook@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>, 
	Akira Yokosawa <akiyks@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Paul and Akira,

Our Chinese version editor Yunjing Li points out that there is a line
missing in Figure E.7, there should be 7, but Figure E.7 has only 6.

Similarly, I found there should be 6 lines in Figure 10.18, but
actually it has only 5.

Although I am very glad to fix the above possible bugs, fixing them is
beyond my capability.

Thanks, Zhouyi
Reported-by: Yunjing Li
Reported-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
