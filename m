Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:references:cc:to:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=jkdqTyueKA/4JMAkwvt7wZDXS+BDi285FuRy2t82EqI=;
 b=jx4XYlgD8OE1Rkd60CaALXoAwYo5Gn8c6RZe7ASIZX1xg/nIgC2UIyo2bL/X2kAnj4
 ewKy8/3HyGB3M/vE3j8KPY3bo9B9PNL6zHzCSL/WFKGxCp1O0DTFUJRVWrYtGJatH/oA
 NybbxwCaVK6zDZOj/+hii8WdIY1Ze0Mxd43jIKtv2dMCXTaONbDQL7shuTjHZ2CjI7T+
 VeYTABcieUapo7GNeDIc54bbsDBAo3hFgH5ntZm4ZPdCuvsj7abFQ8aFQ+dT3msXijLl
 bb1XQdE1Y53PnCE4YJaDGFEmCsukWbKflEuBEdP/obqP1xNkW0LvRNoCXFr225MYf/qO
 EcNg==
Subject: [PATCH v2 0/2] Follow up patches to FAQ-BUILD update
References: <d4e3f6ba-bdc9-fa85-7404-f189adfb6436@gmail.com>
 <20170323153558.GD3637@linux.vnet.ibm.com>
 <c7a6f457-3914-9e5e-a42a-29e9b8f67b77@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <7dd80f92-b8e7-3912-9bca-e59100e4665d@gmail.com>
Date: Fri, 24 Mar 2017 22:48:33 +0900
MIME-Version: 1.0
In-Reply-To: <c7a6f457-3914-9e5e-a42a-29e9b8f67b77@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From dd65cd3918b33e9bd267661ea697b39755be72a1 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 24 Mar 2017 22:42:36 +0900
Subject: [PATCH v2 0/2] Follow up patches to FAQ-BUILD update

(I messed up thread relation and made some typo. Let me do it again.)

Hi Paul,

This is a nitpick patch set to the update of FAQ-BUILD.txt.

Patch 1 is a typo fix relative to the patch "FAQ-BUILD.txt:
Fix misinformation crept in wordsmithing" I sent earlier.

Patch 2 is to detect another build error condition to happen
when you fail to update font-map database after manually
installing a font package.

                            Thanks, Akira
--

Akira Yokosawa (2):
  FAQ-BUILD.txt: Typo fix
  Add another build error check

 FAQ-BUILD.txt              | 2 +-
 utilities/runfirstlatex.sh | 6 ++++++
 utilities/runlatex.sh      | 6 ++++++
 3 files changed, 13 insertions(+), 1 deletion(-)

-- 
2.7.4


