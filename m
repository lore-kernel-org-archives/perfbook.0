Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:46892 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726009AbgDJPPa (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Fri, 10 Apr 2020 11:15:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586531730;
        bh=6gDYpdJQ5HEtHeUPC5u+LBMJu/gvg5XT++hI8s/Loys=;
        h=Date:From:To:Cc:Subject:Reply-To:From;
        b=uEt9hRCp07eofOaz7oF2Y93qFdZizHHY36To/T20el1/KHZSHhTbbGyJ17wUV0nOs
         NV53ZAzVyKIi9uADhpE6GecPRvf1KQ8ot+ai2KVi1m8Kj+qCMPfEW/18nUFIY90aA5
         mcHsyveMZfHmrJysWO9rgWoH33fvTIgx+3T4gcEc=
Date: Fri, 10 Apr 2020 08:15:30 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Pulled and rebased fix, thank you!
Message-ID: <20200410151530.GA17849@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: igor.dzreyev@gmail.com
Cc: perfbook@vger.kernel.org

Hello, Igor,

I pulled and rebased you fix, thank you!  I added your Signed-off-by,
but please let me know if that is a problem for you.  Please see below
for the revised commit.

							Thanx, Paul

------------------------------------------------------------------------

commit bbac20d336b4ee403ff7fd183a9d8343041214c8
Author: Igor Dzreyev <igor.dzreyev@gmail.com>
Date:   Thu Apr 9 11:56:41 2020 +0300

    toolsoftrade: Fix a typo in pcreate.c
    
    Signed-off-by: Igor Dzreyev <igor.dzreyev@gmail.com>
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/CodeSamples/toolsoftrade/pcreate.c b/CodeSamples/toolsoftrade/pcreate.c
index b5e173e..f1e6ff3 100644
--- a/CodeSamples/toolsoftrade/pcreate.c
+++ b/CodeSamples/toolsoftrade/pcreate.c
@@ -45,7 +45,7 @@ int main(int argc, char *argv[])
 
 	if ((en = pthread_create(&tid, NULL,		//\lnlbl{create:a}
 	                         mythread, NULL)) != 0) {//\lnlbl{create:b}
-		fprintf(stderr, "pthread_join: %s\n", strerror(en));
+		fprintf(stderr, "pthread_create: %s\n", strerror(en));
 		exit(EXIT_FAILURE);
 	}
 
