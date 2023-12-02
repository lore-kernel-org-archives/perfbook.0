Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GEgIgiLu"
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 279C211F
	for <perfbook@vger.kernel.org>; Sat,  2 Dec 2023 09:26:23 -0800 (PST)
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-35d67599613so388825ab.3
        for <perfbook@vger.kernel.org>; Sat, 02 Dec 2023 09:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701537982; x=1702142782; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=egGF5V8TtWOyfa/GAcAs9feV3BDwn2Ue8degC6ZgRKs=;
        b=GEgIgiLuHcXXjBnE36zNmzdoMTXlVzD8QBloVZeZhB7yjogQmMqLPanttP1JIS3o15
         TzuqrE+SsDp2WBfdjfJni1yxd9RG3Ufkf7+ddbfs5nKE6EAKFMIigvuoa7QoF1tu7363
         nC7BxZm13kb4QukYLShzz7qxzlIpqv/5QpzTcXsKrV+j4/ZYmdNVj5EaVhWu6EL3bdrT
         GP3d/uscLqDe8nXjLOH1DAAJVeOSK4UTPt09BQRv8B59twdWQKPSKAHbqcyRRkUKVVbz
         2gDnzrhVYJr+KLkYn6UCH/+Rus3NibIP2oBfxdgRsDff3OXLWjO2tFHr5nd+RpABm15M
         f9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701537982; x=1702142782;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=egGF5V8TtWOyfa/GAcAs9feV3BDwn2Ue8degC6ZgRKs=;
        b=izYXfEQnJztVtB5Ow51B3fLDqUALQckirLQQwQKacjZY8pDJ9HYuFFBxSMniA+PZl7
         DJ+33VpCkd7QFgB/Vr3U+mN4jeku4hE9PhuLWrIIFQlN5Irkb0yJeQ2dwr3eEiwvs2n8
         lL3+Xedw+4APGcg66UfTechPE3pyULxsM0dX63ae7FNN5DTI8FFFJ8t1y3w16l5Fe2l+
         arhcChTdKTFWT4D3an7YhNqBuTtEnKNOXwTJHUhwnXFXPONjtW9crwOMhgnijgWUGFIg
         sSycwRE9pwhlvHlaDfVeCBUPLvRL2uK5pA0YcfIx1rTAFUOxGmXld+Mb9FpXsE2WUmyN
         TNbg==
X-Gm-Message-State: AOJu0Yy6rtJZG/KdL9UoKFLj8hY1heH7CMHb08WZT36TIZq+2wbB3h0k
	41UgH9fobN53Rg5+O9XXn2s=
X-Google-Smtp-Source: AGHT+IHmOHzaHyDx+iqVF5hLEUwMoW8ZF6M8r6ogWfQ9roPTzTQV5tRu3XgEmpe9yahGTuleLqterQ==
X-Received: by 2002:a05:6e02:1a6f:b0:35d:59a2:2cb with SMTP id w15-20020a056e021a6f00b0035d59a202cbmr2531163ilv.107.1701537982064;
        Sat, 02 Dec 2023 09:26:22 -0800 (PST)
Received: from localhost.localdomain ([216.243.7.87])
        by smtp.gmail.com with ESMTPSA id x12-20020a170902ea8c00b001c736b0037fsm3600714plb.231.2023.12.02.09.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 09:26:21 -0800 (PST)
From: SeongJae Park <sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org,
	SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 1/7] future/tm: Remove unnecessary spaces
Date: Sat,  2 Dec 2023 09:26:08 -0800
Message-Id: <20231202172614.20239-2-sj38.park@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231202172614.20239-1-sj38.park@gmail.com>
References: <20231202172614.20239-1-sj38.park@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>

A couple of sentences in future/tm.tex are having two spaces between two
words unnecessarily.  Remove one.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 future/tm.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/future/tm.tex b/future/tm.tex
index e6985099..1de900b8 100644
--- a/future/tm.tex
+++ b/future/tm.tex
@@ -126,7 +126,7 @@ Here are some options for handling of I/O within transactions:
 	However, special handling is required in cases where multiple
 	record-oriented output streams are merged onto a single file
 	from multiple processes, as might be done using the ``a+''
-	option to \co{fopen()} or the \co{O_APPEND}  flag to \co{open()}.
+	option to \co{fopen()} or the \co{O_APPEND} flag to \co{open()}.
 	In addition, as will be seen in the next section, common
 	networking operations cannot be handled via buffering.
 \item	Prohibit I/O within transactions, so that any attempt to execute
@@ -240,7 +240,7 @@ Here are some options available to TM:
 	back, with consequent degradation of performance and scalability.
 	This approach nevertheless might be valuable given long-running
 	transactions ending with an RPC\@.
-	This approach must still restrict  manual transaction-abort
+	This approach must still restrict manual transaction-abort
 	operations.
 \item	Identify special cases where the RPC response may be moved out
 	of the transaction, and then proceed using techniques similar
-- 
2.17.1

