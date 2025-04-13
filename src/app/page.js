"use client";

import { useRouter } from "next/navigation";
import { useState } from "react";
import { doLogin } from "@/services/Web3Service";

export default function Home() {
  const router = useRouter();

  const [message, setMessage] = useState();

  const [loading, setLoading] = useState(false);

  function btnLoginClick() {
    setLoading(true);
    setMessage("Conectando na carteira... aguarde...");
    doLogin()
      .then((account) => router.push("/create"))
      .catch((err) => {
        console.error(err);
        setMessage(err.message);
        setLoading(false);
      });
  }

  return (
    <>
      <div className="container px-4 py-5">
        <div className="row flex-lg-row-reverse align-items-center g-5 py-5">
          <div className="col-6 ">
            <img
              src="https://distresscentre.com/wp-content/uploads/2024/01/donating-money-1-1024x672.jpg"
              className="d-block mx-lg-auto img-fluid"
              width={700}
              height={500}
            ></img>
          </div>
          <div className="col-6">
            <h1 className="display-5 fw-bold text-body-emphasis lh-1 mb-3">
              Donate Crypto
            </h1>
            <p className="lead">Sua plataforma descentralizada de doações.</p>
            <p className="lead">
              Autentique-se com sua carteira e crie sua campanha.
            </p>
            <p className="lead mb-3">
              Para doações, use o link da campanha já existente.
            </p>
            <div className="d-flex justify-content-start mt-5">
              <button
                type="button"
                className="btn btn-primary btn-lg px-4 me-2"
                onClick={btnLoginClick}
                disabled={loading} // desativa o botão durante o loading
              >
                <img
                  src="/metamask.svg"
                  width={32}
                  className="me-2"
                  alt="MetaMask"
                />
                {loading ? "Conectando..." : "Conectar com a MetaMask"}
              </button>
            </div>
            {message ? (
              <div className="alert alert-success p-3 col-6 mt-3" role="alert">
                {message}
              </div>
            ) : (
              <></>
            )}
          </div>
        </div>
      </div>
    </>
  );
}
