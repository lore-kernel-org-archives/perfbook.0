Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-io0-f195.google.com ([209.85.223.195]:34721 "EHLO
 mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1750990AbdAPXlw (ORCPT <rfc822;perfbook@vger.kernel.org>); Mon, 16
 Jan 2017 18:41:52 -0500
Received: by mail-io0-f195.google.com with SMTP id c80so14159692iod.1 for
 <perfbook@vger.kernel.org>; Mon, 16 Jan 2017 15:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:to:subject:date:message-id;
 bh=tohcQmp0jX5vaSvBjcX68tz7hLsHBbcjz+M4p4Y1/B0=;
 b=PF0gMHB/B5V70vR33qZ9UlnaFI8xYjS+xDULhivXC4rNcrmCyt5bri39DqL1u5AO6z
 6D1i9uNnOtEKb5pLPyO1WL6ugyQ1po8Fu5No+Ik//g81WL5bTpJ8hCsvWezGDunWlwaS
 Sm3QM8c5/OUH71dmTjEVYmuWdCGuckez/4G1NjrRhczotrxDJrlVTJtXZAm2ieUW3inE
 5kan+umOMwWBtz9hqoTHh25rn1gfXApIyStXEvY92q8xrFTq1h5Ldi2PRO0q/rME8ErQ
 9E8BTQ1FErO69lF6ef9VOsvoNDZQvwFZ68AoPeCoqVrQEol0nSLoviBD7jCgmTPnJfWJ
 liTw==
Received: from linux-uys3.suse (dsl-67-55-28-109.acanac.net. [67.55.28.109])
 by smtp.gmail.com with ESMTPSA id c9sm12134540ioc.2.2017.01.16.15.41.48 for
 <perfbook@vger.kernel.org> (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA
 bits=128/128); Mon, 16 Jan 2017 15:41:50 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
Subject: [PATCH] utilities/autodate.sh: too many \s
Date: Mon, 16 Jan 2017 18:41:25 -0500
Message-Id: <20170116234125.28692-1-twoerner@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Remove extraneous \ which causes build to fail:

	! LaTeX Error: There's no line here to end.

	See the LaTeX manual or LaTeX Companion for explanation.
	Type  H <return>  for immediate help.
	 ...

	l.2 \\n
	       ewcommand{\\commityear}{2017}
	?
	! Emergency stop.
	 ...

	l.2 \\n
	       ewcommand{\\commityear}{2017}
	Your command was ignored.
	Type  I <command> <return>  to replace it with another command,
	or  <return>  to continue without it.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 utilities/autodate.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utilities/autodate.sh b/utilities/autodate.sh
index 6df8f99..84b4ea7 100644
--- a/utilities/autodate.sh
+++ b/utilities/autodate.sh
@@ -45,4 +45,4 @@ year=`date --date="$date_str" +%Y`
 day=`date --date="$date_str" +%e`

 echo "\\date{$month $day, $year$modified}"
-echo "\\\newcommand{\\\commityear}{$year}"
+echo "\\newcommand{\\commityear}{$year}"
-- 
2.11.0.258.ge05806d

