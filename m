Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J8EPj+Xj"
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 901A9124
	for <perfbook@vger.kernel.org>; Sat,  2 Dec 2023 09:26:21 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1d06d42a58aso7866065ad.0
        for <perfbook@vger.kernel.org>; Sat, 02 Dec 2023 09:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701537981; x=1702142781; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yjDOGz/BSdN3AkiQyMGXJtzekRtFgr3nwFyx05oMmEI=;
        b=J8EPj+XjjTuA8/OVl4PyC84bsoFesK52Iq3KBS7lP18NFDVgBIKlsLBz6aJDh3rd4H
         osd2NADJZhUgEtMH6Vgqs8QGEJei/x1xv4nu4WxmfMLUVkJSmrB+MLiVsAXM2dbcTEji
         /evk6PZuR1grMFV+qf/df+uNf92hS/ylsyudKOZ9PtTO9gllhoVmYo1dAD8qRWZ/1c76
         SGiBQ0bRjSXOSvYB8Up8I4xbIl/RYV9wTDwyVDOjTQbiPaX3sBuZcxHJp0vTERHUcNrn
         3SiksE6q5krtzu78FA6UZC6jNzlAC+/+f51auI7fqoNRRCt8OEMiBkMJ1sq5WBY4z3FI
         3Chg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701537981; x=1702142781;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yjDOGz/BSdN3AkiQyMGXJtzekRtFgr3nwFyx05oMmEI=;
        b=jPdQDQsl8r+nPxJr0rJSaxP8EQ3qM0/ek44tU6fMn482J8hSoXgXnX1lySlIgx14q7
         93mmZYePMIgxHKLI8bxgs8eWG4NXQGSQu/yfmonFXbcW7B9DzxoApx3M30jpqQpZAjGm
         qaQZEDO/1qdz6pL+p2aOQBdZWA8kigpLXJD86RBQx3x8vDWwhAid5PogOESrnx218HY4
         PMAJe4k1ZgaViiVDBL5llM/4pZC2iD5ocZkwnbsZON05SLlJTqWBI8LNowRJbIDQ8Wuu
         WDBl+8UlL3MHRltTZ/0Rp0rbrMZXclSxvt/MsESKRwsjH2oOOHl3Ql9QenyjYbfTKD73
         w5LA==
X-Gm-Message-State: AOJu0Yyu0ywImcw/I4NqMhA0nNuxQnRRgJw5C8vEZLYgc+cVQ44yQORK
	qRj82yWg/FmjrWQzoUQYdHGfzwB9aJfm0A==
X-Google-Smtp-Source: AGHT+IFoReiatgQatk6OZY4Y5W4dW/B9bWC+Nnpyi8bLAw5WhWEKkreNdMnlQ0q//i4jIE9LNpk7mg==
X-Received: by 2002:a17:902:d48b:b0:1d0:7232:474c with SMTP id c11-20020a170902d48b00b001d07232474cmr1352511plg.25.1701537980929;
        Sat, 02 Dec 2023 09:26:20 -0800 (PST)
Received: from localhost.localdomain ([216.243.7.87])
        by smtp.gmail.com with ESMTPSA id x12-20020a170902ea8c00b001c736b0037fsm3600714plb.231.2023.12.02.09.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 09:26:20 -0800 (PST)
From: SeongJae Park <sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org,
	SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 0/7] future: Trivial fixups
Date: Sat,  2 Dec 2023 09:26:07 -0800
Message-Id: <20231202172614.20239-1-sj38.park@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>

This patchset contains trivial fixups for future/, which found while
doing Korean translation[1].

[1] https://github.com/sjp38/perfbook-ko_KR

SeongJae Park (7):
  future/tm: Remove unnecessary spaces
  future/tm: Add introduction of TM-availabe options for locking
  future/tm: Consistently add dash between reader and writer of
    reader-writer lock
  future/htm: Remove unnecessary extra 'and'
  future/htm: Use \co{} in favor of $$
  future/formalregress: Use \co{} for spin
  future/formalregress: Use SEL4 consistently

 future/formalregress.tex | 6 +++---
 future/htm.tex           | 4 ++--
 future/tm.tex            | 8 +++++---
 3 files changed, 10 insertions(+), 8 deletions(-)

-- 
2.17.1

