Return-Path: <SRS0=65dD=ZU=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NKAKEJnTag+FsJUa5C5fUTnPy4DyoL9wegnnY8pda4U=;
        b=tdlZoFitVQnDM0V875kTDdrXRN/fDBnOFHL9MY7QrqkFSkiLh6PAz3v/wvawskJ0Z2
         Iui/jSBlqruyEBom3VZ7L7xAGTGtJrfAO5dlWa1fUE8O5k6E1TDFhfANMsmm6zWQaEUg
         L8FELaXp9ZafDEzuXP7Fo6ntmAb7H6fm4cn0CQOVyuS7wxHp4lwe5mJDuEUHQ2rSRC6t
         P47vAAXQUq8ko3ovXQe0Mm/yJ84ACJVpVwx2wzq0ciqy6suZtK6vwylWjSii06ovVSDD
         aoAY0z56h9ydKqI4QI+U0u/nsiT+srI/2vyfMm6U4b/pYF/wG4fqjT/EofF7A6A3P9+c
         0wJg==
Subject: [PATCH 1/3] bib/swtools: Add entries of reports on store tearing
References: <c132d968-1c16-ebfa-ca7f-9b3caff5eecb@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <98ace197-9fa3-f072-0435-d378c3ef60ff@gmail.com>
Date: Fri, 29 Nov 2019 07:25:39 +0900
MIME-Version: 1.0
In-Reply-To: <c132d968-1c16-ebfa-ca7f-9b3caff5eecb@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From bb50063d1efafa1434449ef9c5c5968dcc00d772 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 28 Nov 2019 07:42:06 +0900
Subject: [PATCH 1/3] bib/swtools: Add entries of reports on store tearing

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/swtools.bib | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/bib/swtools.bib b/bib/swtools.bib
index ea5b1849..b239082e 100644
--- a/bib/swtools.bib
+++ b/bib/swtools.bib
@@ -600,6 +600,15 @@ Architectural Support for Programming Languages and Operating Systems
 ,DOI={ 10.1007/978-3-642-33125-1_22 }
 }
 
+@unpublished{KonstantinKhlebnikov2013gccstoretearing
+,Author="Konstantin Khlebnikov and Paul E. McKenney"
+,Title="{RCU: non-atomic assignment to long/pointer variables in gcc}"
+,month="January"
+,day="15"
+,year="2013"
+,note="\url{https://lore.kernel.org/lkml/50F52FC8.4000701@openvz.org/}"
+}
+
 @unpublished{ThomasSewell2013L4binaryVerification
 ,Author="Thomas Sewell and Toby Murray"
 ,Title="Above and Beyond: {seL4} Noninterference and Binary Verification "
@@ -1188,6 +1197,15 @@ Michalis Kokologiannakis"
 ,note="\url{http://www.open-std.org/jtc1/sc22/wg14/www/docs/n2369.pdf}"
 }
 
+@unpublished{WillDeacon2019StoreTearingReport
+,Author="Will Deacon"
+,Title="{Re: [PATCH 1/1] Fix: trace sched switch start/stop racy updates}"
+,month="August"
+,day="21"
+,year="2019"
+,note="\url{https://lore.kernel.org/lkml/20190821103200.kpufwtviqhpbuv2n@willie-the-truck/}"
+}
+
 @unpublished{DanielBristotdeOliveira2019formal
 ,Author="Daniel Bristot de Oliveira"
 ,Title="Formal verification made easy (and fast)!"
-- 
2.17.1


