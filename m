Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ToYes5G/"
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AE64129
	for <perfbook@vger.kernel.org>; Sat,  2 Dec 2023 09:26:23 -0800 (PST)
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3580b94ac2eso15834395ab.0
        for <perfbook@vger.kernel.org>; Sat, 02 Dec 2023 09:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701537983; x=1702142783; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z9s9tfGnVWlFkpiAOWzUsZdGfW+wUlVka5PQEFi54TE=;
        b=ToYes5G/EfdZkloSxszYmdz85LDuAsw9fDiZxRWOTIBcmxUPB1GH8ryMBSLSmf6NO9
         bRKF1SOnyhs3P8BO81/hJLX96Tx8eebE19LHZlAkwHV6igqYdzArIt8pldu3UU0fOg2p
         feqJLF2+45uLOnyhM/33X7HgAjec34+DdvB/NN3E4nHATKES61aCoJt5bR55N/E449Mt
         rZCwx6K8NmINFnO8C1O6gnADvnJ71mUCpbMggOFz3hh5ZNFZ1Rz1WEdmyIb1/f7yQip+
         CBSu1spPPRFLxkQ82kU4ILa8LS8P2ulEmsx/v+CRkf0fe+HjeHsnvj6hY1EQUSnG91ba
         ZlDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701537983; x=1702142783;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z9s9tfGnVWlFkpiAOWzUsZdGfW+wUlVka5PQEFi54TE=;
        b=LJYTyBuKrMm812JDZSApRu/B0jNkJ9kzWS2Eubx6lsW6lE/TbkoKjsVGz4sH29RgjH
         cER9rlniNf+lIqWW5hM8dH4NSxCLmBtft7LQuMbwuzAkpcyEOfooSDzm2TsidCg1jJRR
         8g1ECI+ZAcGkWI4xSInOxGIoaHHdNyE4+vrVM+XhFz6qgGj26t9NGJtWKBb8bFmpY2/k
         cTmS9tXk1UDNvuuCOM6G6Un7r+6KwsiCmrW1pJni4ccgGE0RKGsds89sOgqq6lig1Yqn
         SN8TmPGE6f/AZPvrEm7tQYOO0zBbOeJjlNnVMcccl2C5EZsYbjy1bVwA5tt5beXN1MUN
         g4zw==
X-Gm-Message-State: AOJu0YwxQ4gdC9M9caU4C3o9rBbxyr9MK9teVUkXPJ8gge1HlUeHQta0
	CzoWgZulN1camvzUfL24m6o=
X-Google-Smtp-Source: AGHT+IGx3akvd7c9T6TA/U2uN5u/nt7Vi6tuRb3i1nj1ty3h8GBf025qANapNwjTmNl8BVSeNHZS7w==
X-Received: by 2002:a92:c103:0:b0:35d:59a2:2da with SMTP id p3-20020a92c103000000b0035d59a202damr1798374ile.122.1701537982898;
        Sat, 02 Dec 2023 09:26:22 -0800 (PST)
Received: from localhost.localdomain ([216.243.7.87])
        by smtp.gmail.com with ESMTPSA id x12-20020a170902ea8c00b001c736b0037fsm3600714plb.231.2023.12.02.09.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 09:26:22 -0800 (PST)
From: SeongJae Park <sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org,
	SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 2/7] future/tm: Add introduction of TM-availabe options for locking
Date: Sat,  2 Dec 2023 09:26:09 -0800
Message-Id: <20231202172614.20239-3-sj38.park@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231202172614.20239-1-sj38.park@gmail.com>
References: <20231202172614.20239-1-sj38.park@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>

'Locking' section provides TM-available options without any introduction
of it, unlike other sections.  Add it.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 future/tm.tex | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/future/tm.tex b/future/tm.tex
index 1de900b8..8b8efa98 100644
--- a/future/tm.tex
+++ b/future/tm.tex
@@ -775,6 +775,8 @@ programs containing small amounts of locking, they are often completely
 unacceptable for production-quality lock-based programs wishing to use
 the occasional transaction.
 
+Here are some options available to TM:
+
 \begin{enumerate}
 \item	Use only locking-friendly TM implementations~\cite{DaveDice2006DISC}.
 	Unfortunately, the locking-unfriendly implementations have some
-- 
2.17.1

