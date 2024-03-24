import pandas as pd
import requests
from urllib.error import URLError

CSV_CONFIG = {
    "encoding": "UTF-8",
    "header": True,
    "sep": "|",
    "index": True,
    "na_rep": "",
    "lineterminator": "\n",
    "doublequote": False,
    "escapechar": "\\",
}

csv_config = CSV_CONFIG | dict(index_label="id")



def main():
    with requests.Session() as session:
        while True:
            try:
                concessionFuel = session.get("https://api.ure.gov.pl/api/ConcessionFuel").json()
                concessionOtherFuel = session.get("https://api.ure.gov.pl/api/ConcessionOtherFuel").json()
                concessionExpiry = session.get("https://api.ure.gov.pl/api/ConcessionExpiry").json()
                concessionPromise = session.get("https://api.ure.gov.pl/api/ConcessionPromise").json()
                concessionWithdrawn = session.get("https://api.ure.gov.pl/api/ConcessionWidthdrawn").json()
                concessionApplication = session.get("https://api.ure.gov.pl/api/ConcessionApplication").json()
                concessionWithoutRecognition = session.get("https://api.ure.gov.pl/api/ConcessionAdministrativeProceedingNoRecognition").json()
                concessionRemitted = session.get("https://api.ure.gov.pl/api/ConcessionAdministrativeProceedingRemitted").json()
                concessionRefused = session.get("https://api.ure.gov.pl/api/ConcessionAdministrativeProceedingRefused").json()
                break
            except Exception as e:
                print(e)

        pd.DataFrame(concessionFuel).applymap(
            lambda cell_value: ' '.join(cell_value.split()) if isinstance(cell_value, str) else cell_value) \
            .applymap(
            lambda cell_value: cell_value.replace('|', ',') if isinstance(cell_value, str) else cell_value).to_csv(
            "concessionFuel.csv",
            **csv_config
        )
        pd.DataFrame(concessionOtherFuel).applymap(
            lambda cell_value: ' '.join(cell_value.split()) if isinstance(cell_value, str) else cell_value) \
            .applymap(
            lambda cell_value: cell_value.replace('|', ',') if isinstance(cell_value, str) else cell_value).to_csv(
            "concessionOtherFuel.csv",
            **csv_config
        )
        pd.DataFrame(concessionExpiry).applymap(
            lambda cell_value: ' '.join(cell_value.split()) if isinstance(cell_value, str) else cell_value) \
            .applymap(
            lambda cell_value: cell_value.replace('|', ',') if isinstance(cell_value, str) else cell_value).to_csv(
            "concessionExpiry.csv",
            **csv_config
        )
        pd.DataFrame(concessionPromise).applymap(
            lambda cell_value: ' '.join(cell_value.split()) if isinstance(cell_value, str) else cell_value) \
            .applymap(
            lambda cell_value: cell_value.replace('|', ',') if isinstance(cell_value, str) else cell_value).to_csv(
            "concessionPromise.csv",
            **csv_config
        )
        pd.DataFrame(concessionWithdrawn).applymap(
            lambda cell_value: ' '.join(cell_value.split()) if isinstance(cell_value, str) else cell_value) \
            .applymap(
            lambda cell_value: cell_value.replace('|', ',') if isinstance(cell_value, str) else cell_value).to_csv(
            "concessionWithdrawn.csv",
            **csv_config
        )
        pd.DataFrame(concessionApplication).applymap(
            lambda cell_value: ' '.join(cell_value.split()) if isinstance(cell_value, str) else cell_value) \
            .applymap(
            lambda cell_value: cell_value.replace('|', ',') if isinstance(cell_value, str) else cell_value).to_csv(
            "concessionApplication.csv",
            **csv_config
        )
        pd.DataFrame(concessionWithoutRecognition).applymap(
            lambda cell_value: ' '.join(cell_value.split()) if isinstance(cell_value, str) else cell_value) \
            .applymap(
            lambda cell_value: cell_value.replace('|', ',') if isinstance(cell_value, str) else cell_value).to_csv(
            "concessionWithoutRecognition.csv",
            **csv_config
        )
        pd.DataFrame(concessionRemitted).applymap(
            lambda cell_value: ' '.join(cell_value.split()) if isinstance(cell_value, str) else cell_value) \
            .applymap(
            lambda cell_value: cell_value.replace('|', ',') if isinstance(cell_value, str) else cell_value).to_csv(
            "concessionRemitted.csv",
            **csv_config
        )
        pd.DataFrame(concessionRefused).applymap(
            lambda cell_value: ' '.join(cell_value.split()) if isinstance(cell_value, str) else cell_value) \
            .applymap(
            lambda cell_value: cell_value.replace('|', ',') if isinstance(cell_value, str) else cell_value).to_csv(
            "concessionRefused.csv",
            **csv_config
        )

if __name__ == '__main__':
    import ssl

    ssl._create_default_https_context = ssl._create_unverified_context
    main()
