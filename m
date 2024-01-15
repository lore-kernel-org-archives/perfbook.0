Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA261E873
	for <perfbook@vger.kernel.org>; Mon, 15 Jan 2024 11:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5YsKI9o"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1d54b86538aso43210115ad.0
        for <perfbook@vger.kernel.org>; Mon, 15 Jan 2024 03:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705317519; x=1705922319; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/J/NomUcu/TDsYi0Cbkxd1RhILuLOzfv0HA6HwFezGM=;
        b=S5YsKI9oCMLu0LKtIdYC00kvcnbkXRKr9MU8dzi/+37olaWxm1PmcpdsB+TJHNsMoj
         cRBwv3w2xaWqFvyBafJzqJ3AXJkN9YGm1QkuD9y5lfclMRsPHZ3sYhNv5aMboEgkRAU9
         doUiuYspB57Zpp3DwdkmQXzhJTckQwi0iqlC/pRjt4tyRB7D2ddqPMs9x0UPsOg80zkV
         aogUF9Q/9zSLdj8c1sB/TDqRdyRHbUr9i6IZ1zPW2MK4YOwDip2bvfhDarEZiVUGXy75
         PeXWAcQCx8RYwZswgm9nRdym5eYqV5cHiHO2TsfCyyBTfOEofUeldEz1XksaBh1A619Q
         9URA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705317519; x=1705922319;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/J/NomUcu/TDsYi0Cbkxd1RhILuLOzfv0HA6HwFezGM=;
        b=Ozmr1kGTLPRcuZopTBFWg595ibTyQYBwOQ06J6jjtYeaBn24WDotgkbPPS2zL7xBo1
         jxZAHFi0TuHEHGtqaV1E7t9JNy8fM5TAO2VzWzYuBwzgXwru2VxJM0JTWiyAplNUMrW6
         rQPjL0ymf2NITAdtqmRTUvuUvH8l2nQrQ/PFwzbDCa/XbWprHxiT1f7i6EhD4hzxgLOG
         7BCaHsgspm/2JuD0eYn57OruXI3kOt1ZhiKAaD3nvWR6jSKZdIEjq8v+qk/k2U+xLI/b
         4lqbRTfMWFkz1ocmozforBgBFEVnr/tcylGATclCnvwcHa4djkOCVkobePfJUx+a1fkW
         nc6A==
X-Gm-Message-State: AOJu0Yy3zXzVHt4X47/yJ1OdyylFptu60ZhfpF4ZtISrT7SfwCjskZ+f
	x0IQBTPaRUBPddqx/pkBAjn5AwpqVkE=
X-Google-Smtp-Source: AGHT+IFu9eSJ+ErxpArg4Z3pPR/MU15uXoYDqPuwYQtAIGpSA3cE2zZbDizudjHJxWZnj0sWKItWsw==
X-Received: by 2002:a17:903:245:b0:1d4:cb95:179d with SMTP id j5-20020a170903024500b001d4cb95179dmr2831404plh.100.1705317519119;
        Mon, 15 Jan 2024 03:18:39 -0800 (PST)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id e14-20020a170902cf4e00b001d4b6d64041sm7441178plg.240.2024.01.15.03.18.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jan 2024 03:18:38 -0800 (PST)
Message-ID: <e609d522-5652-4622-8e4b-f17c840055d3@gmail.com>
Date: Mon, 15 Jan 2024 20:18:37 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: There is a line missing in the diagram Figure 10.18 and Figure
 E.7
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
References: <CAABZP2z38Yg+J6veQQxO12rUMroPQM7ZOz=Bg6GTYn5G9r85Qw@mail.gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>,
 Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <CAABZP2z38Yg+J6veQQxO12rUMroPQM7ZOz=Bg6GTYn5G9r85Qw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Zhouyi,

On 2024/01/15 15:20, Zhouyi Zhou wrote:
> Hi Paul and Akira,
> 
> Our Chinese version editor Yunjing Li points out that there is a line
> missing in Figure E.7, there should be 7, but Figure E.7 has only 6.
> 
> Similarly, I found there should be 6 lines in Figure 10.18, but
> actually it has only 5.

There is a footnote on the uppermost three traces of Figure 10.18,
which reads:

    You see only two traces? The dashed one is composed of two
    traces that differ only slightly, hence the irregular-looking
    dash pattern.

It was added by commit 27dc9fbe7605 ("datastruct: Expand on the
dash type of traces in Figure 10.19").
Wouldn't it explain your observation?

        Thanks, Akira

> 
> Although I am very glad to fix the above possible bugs, fixing them is
> beyond my capability.
> 
> Thanks, Zhouyi
> Reported-by: Yunjing Li
> Reported-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
